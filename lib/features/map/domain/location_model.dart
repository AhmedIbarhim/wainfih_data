import 'package:latlong2/latlong.dart';

class LocationModel {
  final double latitude;
  final double longitude;

  LatLng get toLatLng => LatLng(latitude, longitude);

  const LocationModel({required this.latitude, required this.longitude});

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'latitude': latitude, 'longitude': longitude};
  }
}
