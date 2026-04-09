import 'package:freezed_annotation/freezed_annotation.dart';

part 'sp_type_model.freezed.dart';
part 'sp_type_model.g.dart';

@freezed
abstract class SpTypeModel with _$SpTypeModel {
  const factory SpTypeModel({
    required int id,
    required String typeNameAr,
    required String typeNameEn,
    Map<String, dynamic>? icon,
  }) = _SpTypeModel;

  factory SpTypeModel.fromJson(Map<String, Object?> json) =>
      _$SpTypeModelFromJson(json);
}
