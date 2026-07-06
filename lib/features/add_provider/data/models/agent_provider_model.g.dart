// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agent_provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AgentProviderModel _$AgentProviderModelFromJson(Map<String, dynamic> json) =>
    _AgentProviderModel(
      serviceProviderNameAr: json['serviceProviderNameAr'] as String?,
      serviceProviderNameEn: json['serviceProviderNameEn'] as String?,
      mobileNumber1: json['mobileNumber1'] as String,
      mobileNumber2: json['mobileNumber2'] as String?,
      contactPersonName: json['contactPersonName'] as String?,
      notes: json['notes'] as String?,
      image: json['image'] as Map<String, dynamic>,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      districtId: (json['districtId'] as num?)?.toInt(),
      typeId: (json['typeId'] as num?)?.toInt(),
      categoryIds: (json['categoryIds'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$AgentProviderModelToJson(_AgentProviderModel instance) =>
    <String, dynamic>{
      'serviceProviderNameAr': instance.serviceProviderNameAr,
      'serviceProviderNameEn': instance.serviceProviderNameEn,
      'mobileNumber1': instance.mobileNumber1,
      'mobileNumber2': instance.mobileNumber2,
      'contactPersonName': instance.contactPersonName,
      'notes': instance.notes,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'districtId': instance.districtId,
      'typeId': instance.typeId,
      'categoryIds': instance.categoryIds,
    };
