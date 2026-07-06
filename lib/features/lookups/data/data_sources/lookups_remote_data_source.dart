import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/paged_response.dart';
import '../../../../core/networking/api_client.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';
import '../models/sp_type_model.dart';
import 'lookups_local_data_source.dart';

class LookupsRemoteDataSource {
  final APIClient _apiClient;

  LookupsRemoteDataSource(this._apiClient);

  Future<Either<String, List<CityModel>>> getCities() async {
    try {
      final response = await _apiClient.get(
        '/city',
        queryParameters: {'take': 1000},
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        CityModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, List<DistrictModel>>> getAllDistricts() async {
    try {
      final response = await _apiClient.get(
        '/district',
        queryParameters: {'take': 10000, 'with': 'city'},
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        DistrictModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, List<DistrictModel>>> getDistrictsByCityId(
    int cityId,
  ) async {
    try {
      final response = await _apiClient.get(
        '/district',
        queryParameters: {
          'take': 1000,
          'filter': 'cityId eq $cityId',
          'with': 'city',
        },
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        DistrictModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, DistrictModel>> getDistrictByCoordinates({
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _apiClient.get(
        '/district/byCoordinates',
        queryParameters: {'lat': lat, 'lng': lng, 'with': 'city'},
      );
      final district = DistrictModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return right(district);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, List<SpTypeModel>>> getServiceProviderTypes() async {
    try {
      final response = await _apiClient.get(
        '/serviceProviderType',
        queryParameters: {'take': 1000},
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        SpTypeModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      final response = await _apiClient.get(
        '/category',
        queryParameters: {'take': 1000},
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        CategoryModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }

  Future<Either<String, LookupsCache>> fetchAllLookups() async {
    // `agent-lookups` now returns only leaf categories. Cities, districts and
    // service-provider types are sourced from their own dedicated endpoints.
    final citiesRes = await getCities();
    final districtsRes = await getAllDistricts();
    final typesRes = await getServiceProviderTypes();
    final categoriesRes = await _getLeafCategories();

    return citiesRes.fold(
      (l) => left(l),
      (cities) => districtsRes.fold(
        (l) => left(l),
        (districts) => typesRes.fold(
          (l) => left(l),
          (serviceTypes) => categoriesRes.fold(
            (l) => left(l),
            (categories) => right(
              LookupsCache(
                cities: cities,
                districts: districts,
                serviceTypes: serviceTypes,
                categories: categories,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Either<String, List<CategoryModel>>> _getLeafCategories() async {
    try {
      final response = await _apiClient.get('/serviceProvider/agent-lookups');
      final data = response.data as Map<String, dynamic>;
      final categories = (data['categories'] as List? ?? const [])
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return right(categories);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        return left('CONNECTION_ERROR');
      }
      final data = e.response?.data;
      final message = (data is Map ? data['message'] : null) ?? 'UNKNOWN_ERROR';
      return left(
        message is List ? message.first.toString() : message.toString(),
      );
    }
  }
}
