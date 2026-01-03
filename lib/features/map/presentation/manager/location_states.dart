import 'package:meta/meta.dart';

import '../../domain/location_model.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

final class LocationLoading extends LocationState {}

final class LocationSuccess extends LocationState {
  final LocationModel location;
  LocationSuccess(this.location);
}

final class LocationError extends LocationState {
  final String message;
  LocationError(this.message);
}
