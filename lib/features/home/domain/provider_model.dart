import 'dart:io';

import 'package:latlong2/latlong.dart';

import '../../details/domain/details_model.dart';
import '../../map/domain/location_model.dart';

class ProviderModel {
  DetailsModel? details;
  List<File>? images;
  LatLng? location;
  ProviderModel({this.details, this.images, this.location});

  toJson() {
    return {
      'details': details?.toJson(),
      'images': images?.map((image) => image.path).toList(),
      'location': location?.toJson(),
    };
  }
}
