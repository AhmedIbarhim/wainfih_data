import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class APIService {
  late final Dio _dio;

  APIService({
    String? baseUrl,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
    Map<String, dynamic>? headers,
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl ?? '',
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers:
            headers ??
            {'Content-Type': 'application/json', 'Accept': 'application/json'},
      ),
    );

    _addInterceptors();
  }

  Dio get dio => _dio;

  void _addInterceptors() {
    // Talker logger interceptor
    _dio.interceptors.add(TalkerDioLogger());

    // Custom interceptor (auth, refresh token, etc.)
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Example: attach token
          // final token = await SecureStorage.getToken();
          // options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException e, handler) {
          // Centralized error handling
          handler.next(e);
        },
      ),
    );
  }

  // ----------------------
  // HTTP METHODS
  // ----------------------

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

/*
USAGE:

final apiClient = APIClient(
  baseUrl: 'https://api.example.com',
);

final response = await apiClient.get('/users');
*/
