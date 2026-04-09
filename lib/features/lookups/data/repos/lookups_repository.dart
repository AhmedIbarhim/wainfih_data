import 'package:dartz/dartz.dart';

import '../data_sources/lookups_remote_data_source.dart';
import '../models/category_model.dart';
import '../models/city_model.dart';
import '../models/district_model.dart';
import '../models/sp_type_model.dart';

class LookupsRepository {
  final LookupsRemoteDataSource _remoteDataSource;

  LookupsRepository(this._remoteDataSource);

  Future<Either<String, List<CityModel>>> getCities() =>
      _remoteDataSource.getCities();

  Future<Either<String, List<DistrictModel>>> getDistrictsByCityId(int cityId) =>
      _remoteDataSource.getDistrictsByCityId(cityId);

  Future<Either<String, DistrictModel>> getDistrictByCoordinates({
    required double lat,
    required double lng,
  }) =>
      _remoteDataSource.getDistrictByCoordinates(lat: lat, lng: lng);

  Future<Either<String, List<SpTypeModel>>> getServiceProviderTypes() =>
      _remoteDataSource.getServiceProviderTypes();

  Future<Either<String, List<CategoryModel>>> getCategories() =>
      _remoteDataSource.getCategories();
}
