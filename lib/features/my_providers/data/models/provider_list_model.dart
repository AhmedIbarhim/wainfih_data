import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../lookups/data/models/sp_type_model.dart';
import '../../../lookups/data/models/district_model.dart';

part 'provider_list_model.freezed.dart';
part 'provider_list_model.g.dart';

@freezed
abstract class ProviderListModel with _$ProviderListModel {
  @JsonSerializable(explicitToJson: true)
  const factory ProviderListModel({
    required int id,
    String? serviceProviderNameAr,
    String? serviceProviderNameEn,
    String? mobileNumber1,
    String? mobileNumber2,
    String? contactPersonName,
    String? notes,
    Map<String, dynamic>? image,
    double? lat,
    double? lng,
    required String state,
    required String status,
    DateTime? createdAt,
    SpTypeModel? type,
    DistrictModel? district,
  }) = _ProviderListModel;

  factory ProviderListModel.fromJson(Map<String, Object?> json) =>
      _$ProviderListModelFromJson(json);
}
