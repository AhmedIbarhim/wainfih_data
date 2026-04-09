// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthModel _$AuthModelFromJson(Map<String, dynamic> json) => _AuthModel(
  token: json['token'] as String,
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthModelToJson(_AuthModel instance) =>
    <String, dynamic>{'token': instance.token, 'user': instance.user.toJson()};
