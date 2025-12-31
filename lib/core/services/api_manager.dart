import 'package:dio/dio.dart';

class ApiManager {
  late final Dio _dio;

  ApiManager({
    String baseUrl = 'https://api-bdc.net/',
    Map<String, dynamic>? defaultHeaders,
    Duration connectTimeout = const Duration(seconds: 30),
    Duration receiveTimeout = const Duration(seconds: 30),
  }) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: defaultHeaders,
        responseType: ResponseType.json,
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: false,
        responseHeader: false,
        request: true,
        requestBody: true,
      ),
    );
  }

  // ========================
  // GET
  // ========================
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }

  // ========================
  // POST
  // ========================
  Future<Response<T>> post<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }

  // ========================
  // PUT
  // ========================
  Future<Response<T>> put<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }

  // ========================
  // PATCH
  // ========================
  Future<Response<T>> patch<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }

  // ========================
  // DELETE
  // ========================
  Future<Response<T>> delete<T>(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers),
        cancelToken: cancelToken,
      );
    } on DioException {
      rethrow;
    }
  }
}
