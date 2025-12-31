import 'package:dartz/dartz.dart';

import 'failure.dart';
import 'location_entity.dart';

abstract class LocationRepo {
  Future<Either<Failure, LocationEntity>> getCurrentLocation();
}
