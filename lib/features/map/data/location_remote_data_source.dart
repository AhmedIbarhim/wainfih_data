import 'package:geolocator/geolocator.dart';

import '../domain/location_entity.dart';

abstract class LocationRemoteDataSource {
  Future<LocationEntity> getCurrentLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<LocationEntity> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    return LocationEntity(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
