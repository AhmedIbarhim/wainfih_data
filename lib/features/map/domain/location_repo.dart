import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import 'location_model.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationModel>> getCurrentLocation();
}
