// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CityModel _$CityModelFromJson(Map<String, dynamic> json) => _CityModel(
  id: (json['id'] as num).toInt(),
  cityNameAr: json['cityNameAr'] as String,
  cityNameEn: json['cityNameEn'] as String,
);

Map<String, dynamic> _$CityModelToJson(_CityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cityNameAr': instance.cityNameAr,
      'cityNameEn': instance.cityNameEn,
    };
