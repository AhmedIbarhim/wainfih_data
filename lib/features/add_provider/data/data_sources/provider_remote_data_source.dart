import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_client.dart';
import '../models/agent_provider_model.dart';

class ProviderRemoteDataSource {
  final APIClient _apiClient;

  ProviderRemoteDataSource(this._apiClient);

  Future<Either<String, Map<String, dynamic>>> uploadImage(File file) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file.path.split('/').last,
        ),
      });
      final response = await _apiClient.post(
        '/file/upload',
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return right(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(message is List ? message.first.toString() : message.toString());
    }
  }

  Future<Either<String, int>> submitProvider(
    AgentProviderModel payload,
  ) async {
    try {
      final response = await _apiClient.post(
        '/serviceProvider/agent-submit',
        data: payload.toJson(),
      );
      final id = (response.data as Map<String, dynamic>)['id'] as int;
      return right(id);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(message is List ? message.first.toString() : message.toString());
    }
  }

  Future<Either<String, int>> updateProvider(
    int id,
    AgentProviderModel payload,
  ) async {
    try {
      final response = await _apiClient.put(
        '/serviceProvider/agent-update/$id',
        data: payload.toJson(),
      );
      final resultId = (response.data as Map<String, dynamic>)['id'] as int;
      return right(resultId);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(message is List ? message.first.toString() : message.toString());
    }
  }
}
