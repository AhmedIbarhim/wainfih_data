import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../domain/location_model.dart';
import '../domain/location_repo.dart';
import 'location_remote_data_source.dart';

class LocationRepoImpl implements LocationRepo {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, LocationModel>> getCurrentLocation() async {
    try {
      final location = await remoteDataSource.getCurrentLocation();
      return Right(location);
    } catch (e) {
      return Left(LocationFailure(e.toString()));
    }
  }
}
