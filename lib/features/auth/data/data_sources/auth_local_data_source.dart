// wainfih_agent_mobile/lib/features/auth/data/data_sources/auth_local_data_source.dart
import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_model.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();

  Future<void> saveToken(AuthModel model);
  Future<AuthModel?> get authModel;
  Future<void> logout();
  Future<bool> get isLoggedIn;
  Future<String?> get token;
  Future<bool> get isTokenValid;
  Future<bool> get isTokenExpired;
  Future<String> getLocale();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final SharedPreferencesAsync _sharedPreferencesAsync;
  final FlutterSecureStorage _secureStorage;

  const AuthLocalDataSourceImpl(
    this._sharedPreferencesAsync,
    this._secureStorage,
  );

  @override
  Future<bool> get isLoggedIn async =>
      await _sharedPreferencesAsync.containsKey('isLoggedIn');

  @override
  Future<bool> get isTokenValid async {
    final t = await token;
    if (t == null) return false;
    try {
      return !JwtDecoder.isExpired(t);
    } catch (_) {
      return true; // No exp claim — treat as valid
    }
  }

  @override
  Future<bool> get isTokenExpired async {
    final t = await token;
    if (t == null) return true;
    try {
      return JwtDecoder.isExpired(t);
    } catch (_) {
      return false; // No exp claim — treat as not expired
    }
  }

  @override
  Future<void> saveToken(AuthModel model) async {
    await _secureStorage.write(
      key: 'model',
      value: jsonEncode(model.toJson()),
    );
    await _sharedPreferencesAsync.setBool('isLoggedIn', true);
  }

  @override
  Future<void> logout() async {
    await _secureStorage.deleteAll();
    await _sharedPreferencesAsync.remove('isLoggedIn');
  }

  @override
  Future<String?> get token async {
    final model = await _secureStorage.read(key: 'model');
    if (model == null) return null;
    return AuthModel.fromJson(jsonDecode(model)).token;
  }

  @override
  Future<AuthModel?> get authModel async {
    final model = await _secureStorage.read(key: 'model');
    if (model == null) return null;
    return AuthModel.fromJson(jsonDecode(model));
  }

  @override
  Future<String> getLocale() async {
    final raw = (await _sharedPreferencesAsync.getString('locale')) ??
        Platform.localeName;
    if (raw.length < 2) return raw.toLowerCase();
    return raw.substring(0, 2).toLowerCase();
  }
}
