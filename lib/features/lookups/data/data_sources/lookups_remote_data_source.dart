import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/paged_response.dart';
import '../../../../core/networking/api_client.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';
import '../models/sp_type_model.dart';

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
      return left(e.message ?? 'Failed to load cities');
    }
  }

  Future<Either<String, List<DistrictModel>>> getAllDistricts() async {
    try {
      final response = await _apiClient.get(
        '/district',
        queryParameters: {
          'take': 10000,
          'with': 'city',
        },
      );
      final paged = PagedResponse.fromJson(
        response.data as Map<String, dynamic>,
        DistrictModel.fromJson,
      );
      return right(paged.content);
    } on DioException catch (e) {
      return left(e.message ?? 'Failed to load districts');
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
      return left(e.message ?? 'Failed to load districts');
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
      return left(e.message ?? 'District not found for this location');
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
      return left(e.message ?? 'Failed to load service types');
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
      return left(e.message ?? 'Failed to load categories');
    }
  }
}
