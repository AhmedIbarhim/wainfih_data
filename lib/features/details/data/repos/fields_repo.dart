import 'package:dartz/dartz.dart';
import 'package:wainfih_data/core/networking/api_client.dart';

import '../../../../core/errors/failure.dart';
import '../models/city_model.dart';

class FieldsRepo {
  final APIClient apiClient;

  FieldsRepo(this.apiClient);

  Future<Either<Failure, List<CityModel>>> getAllCities({
    int? page,
    int? size,
    String? search,
  }) async {
    // try {
    //   final result = await apiService.get(
    //     '/cities',
    //     queryParameters: {'page': page, 'size': size, 'search': search},
    //   );
    //   return result;
    // } catch (e) {
    //   return left(ServerFailure(FailureInfo(exception: e.toString())));
    // }

    throw UnimplementedError();
  }

  Future<Either<Failure, CityModel>> getCityById(int id) async {
    // try {
    //   final result = await apiService.send(
    //     request: GetAllCitiesRequest(id: id),
    //     responseFromMap: CityModel.fromJson,
    //   );
    //   return result;
    // } catch (e) {
    //   return left(UnknownFailure(FailureInfo(exception: e.toString())));
    // }

    throw UnimplementedError();
  }
}
