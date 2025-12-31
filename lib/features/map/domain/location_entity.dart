import 'package:latlong2/latlong.dart';

class LocationEntity {
  final double latitude;
  final double longitude;

  LatLng get toLatLng => LatLng(latitude, longitude);

  const LocationEntity({required this.latitude, required this.longitude});
}
