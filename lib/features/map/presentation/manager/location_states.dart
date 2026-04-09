import '../../domain/location_model.dart';

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
