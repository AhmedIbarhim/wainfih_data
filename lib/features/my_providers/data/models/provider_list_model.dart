import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../lookups/data/models/category_model.dart';
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
    bool? featured,
    bool? bookable,
    double? distance,
    // From the backend's `computed` block on the SP response.
    // - `declineReason`: latest DECLINED status history entry's reason.
    // - `categories`: flattened M2M links so the edit flow can pre-select.
    @JsonKey(readValue: _readComputedDeclineReason) String? declineReason,
    @JsonKey(readValue: _readComputedCategories)
    List<CategoryModel>? categories,
  }) = _ProviderListModel;

  factory ProviderListModel.fromJson(Map<String, Object?> json) =>
      _$ProviderListModelFromJson(json);
}

Object? _readComputedDeclineReason(Map map, String key) {
  final computed = map['computed'];
  if (computed is Map) return computed['declineReason'];
  return null;
}

Object? _readComputedCategories(Map map, String key) {
  final computed = map['computed'];
  if (computed is Map) return computed['categories'];
  return null;
}
