import 'package:freezed_annotation/freezed_annotation.dart';
import 'city_model.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
abstract class DistrictModel with _$DistrictModel {
  @JsonSerializable(explicitToJson: true)
  const factory DistrictModel({
    required int id,
    required String districtNameAr,
    required String districtNameEn,
    required int cityId,
    CityModel? city,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, Object?> json) =>
      _$DistrictModelFromJson(json);
}
