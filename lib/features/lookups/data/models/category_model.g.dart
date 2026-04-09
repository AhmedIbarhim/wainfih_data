// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    _CategoryModel(
      id: (json['id'] as num).toInt(),
      categoryNameAr: json['categoryNameAr'] as String,
      categoryNameEn: json['categoryNameEn'] as String,
      image: json['image'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CategoryModelToJson(_CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryNameAr': instance.categoryNameAr,
      'categoryNameEn': instance.categoryNameEn,
      'image': instance.image,
    };
