import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:synchronized/synchronized.dart';

import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import '../route/routes.dart';

class ApiInterceptor extends QueuedInterceptor {
  final AuthLocalDataSource _authLocalDataSource;
  final GlobalKey<NavigatorState> _navigatorKey;
  static final _lock = Lock();
  bool _didLogout = false;

  ApiInterceptor(this._authLocalDataSource, this._navigatorKey);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _authLocalDataSource.token;
    if (token != null) {
      if (await _authLocalDataSource.isTokenExpired) {
        if (!_lock.locked) {
          _lock.synchronized(_handleSessionExpired);
        }
        return handler.reject(
          DioException(requestOptions: options),
        );
      }
      _didLogout = false;
    }
    if (options.headers['Authorization'] == null && token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Accept-Language'] =
        await _authLocalDataSource.getLocale();
    super.onRequest(options, handler);
  }

  Future<void> _handleSessionExpired() async {
    if (_didLogout) return;
    _didLogout = true;
    await _authLocalDataSource.logout();
    _navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.login,
      (route) => false,
    );
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    if ((statusCode == 401 || statusCode == 403) &&
        await _authLocalDataSource.isLoggedIn) {
      _lock.synchronized(_handleSessionExpired);
    }
    super.onError(err, handler);
  }
}
