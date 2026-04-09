// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistrictModel _$DistrictModelFromJson(Map<String, dynamic> json) =>
    _DistrictModel(
      id: (json['id'] as num).toInt(),
      districtNameAr: json['districtNameAr'] as String,
      districtNameEn: json['districtNameEn'] as String,
      cityId: (json['cityId'] as num).toInt(),
      city: json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DistrictModelToJson(_DistrictModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'districtNameAr': instance.districtNameAr,
      'districtNameEn': instance.districtNameEn,
      'cityId': instance.cityId,
      'city': instance.city?.toJson(),
    };
