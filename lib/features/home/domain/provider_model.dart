import 'dart:io';

import '../../details/domain/details_model.dart';
import '../../map/domain/location_model.dart';

class ProviderModel {
  DetailsModel? details;
  List<File>? images;
  LocationModel? location;
  ProviderModel({this.details, this.images, this.location});

  toJson() {
    return {
      'details': details?.toJson(),
      'images': images?.map((image) => image.path).toList(),
      'location': location?.toJson(),
    };
  }
}
