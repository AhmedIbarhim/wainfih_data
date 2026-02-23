import 'dart:io';

import 'package:latlong2/latlong.dart';

import '../../details/data/models/details_model.dart';

class ProviderModel {
  String? id;
  DetailsModel? details;
  List<File>? images;
  LatLng? location;
  DateTime? createdAt;
  String? status;

  ProviderModel({
    this.details,
    this.images,
    this.location,
    this.id,
    this.createdAt,
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'details': details?.toJson(),
      'images': images?.map((image) => image.path).toList(),
      'location': location?.toJson(),
      'createdAt': createdAt?.toIso8601String(),
      'status': status,
      'id': id,
    };
  }

  factory ProviderModel.fromJson(Map<String, dynamic> json) {
    return ProviderModel(
      details: json['details'] != null
          ? DetailsModel.fromJson(json['details'])
          : null,
      images: json['images'] != null
          ? List<File>.from(json['images'].map((x) => File(x)))
          : null,
      location: json['location'] != null
          ? LatLng.fromJson(json['location'])
          : null,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : null,
      status: json['status'],
      id: json['id'],
    );
  }
}
