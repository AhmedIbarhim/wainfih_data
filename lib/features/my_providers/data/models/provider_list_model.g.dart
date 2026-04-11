// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProviderListModel _$ProviderListModelFromJson(Map<String, dynamic> json) =>
    _ProviderListModel(
      id: (json['id'] as num).toInt(),
      serviceProviderNameAr: json['serviceProviderNameAr'] as String?,
      serviceProviderNameEn: json['serviceProviderNameEn'] as String?,
      mobileNumber1: json['mobileNumber1'] as String?,
      mobileNumber2: json['mobileNumber2'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      notes: json['notes'] as String?,
      image: json['image'] as Map<String, dynamic>?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
      state: json['state'] as String,
      status: json['status'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      type: json['type'] == null
          ? null
          : SpTypeModel.fromJson(json['type'] as Map<String, dynamic>),
      district: json['district'] == null
          ? null
          : DistrictModel.fromJson(json['district'] as Map<String, dynamic>),
      featured: json['featured'] as bool?,
      bookable: json['bookable'] as bool?,
      distance: (json['distance'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProviderListModelToJson(_ProviderListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'serviceProviderNameAr': instance.serviceProviderNameAr,
      'serviceProviderNameEn': instance.serviceProviderNameEn,
      'mobileNumber1': instance.mobileNumber1,
      'mobileNumber2': instance.mobileNumber2,
      'contactPersonName': instance.contactPersonName,
      'notes': instance.notes,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'state': instance.state,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'type': instance.type?.toJson(),
      'district': instance.district?.toJson(),
      'featured': instance.featured,
      'bookable': instance.bookable,
      'distance': instance.distance,
    };
