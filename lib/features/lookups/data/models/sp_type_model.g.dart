// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sp_type_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpTypeModel _$SpTypeModelFromJson(Map<String, dynamic> json) => _SpTypeModel(
  id: (json['id'] as num).toInt(),
  typeNameAr: json['typeNameAr'] as String,
  typeNameEn: json['typeNameEn'] as String,
  icon: json['icon'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$SpTypeModelToJson(_SpTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'typeNameAr': instance.typeNameAr,
      'typeNameEn': instance.typeNameEn,
      'icon': instance.icon,
    };
