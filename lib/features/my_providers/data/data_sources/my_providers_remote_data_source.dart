import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/paged_response.dart';
import '../../../../core/networking/api_client.dart';
import '../models/provider_list_model.dart';

class MyProvidersRemoteDataSource {
  final APIClient _apiClient;

  MyProvidersRemoteDataSource(this._apiClient);

  Future<Either<String, PagedResponse<ProviderListModel>>> getMyProviders({
    required int page,
    int take = 10,
    String? stateFilter,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'page': page,
        'take': take,
        'with': 'type,district.city,statusHistory',
        'orderBy': 'createdAt:desc',
      };
      if (stateFilter != null) {
        queryParams['filter'] = 'state eq "$stateFilter"';
      }
      final response = await _apiClient.get(
        '/serviceProvider',
        queryParameters: queryParams,
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        ProviderListModel.fromJson,
      );
      return right(paged);
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

  Future<Either<String, ProviderListModel>> getProviderById(int id) async {
    try {
      final response = await _apiClient.get(
        '/serviceProvider/$id',
        queryParameters: {'with': 'type,district.city,statusHistory'},
      );
      final provider = ProviderListModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return right(provider);
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
