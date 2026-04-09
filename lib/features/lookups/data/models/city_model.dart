import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_model.freezed.dart';
part 'city_model.g.dart';

@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    required int id,
    required String cityNameAr,
    required String cityNameEn,
  }) = _CityModel;

  factory CityModel.fromJson(Map<String, Object?> json) =>
      _$CityModelFromJson(json);
}
