import 'package:geolocator/geolocator.dart';

import '../domain/location_model.dart';

abstract class LocationRemoteDataSource {
  Future<LocationModel> getCurrentLocation();
}

class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  @override
  Future<LocationModel> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );

    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}
