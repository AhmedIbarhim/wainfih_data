import 'package:freezed_annotation/freezed_annotation.dart';

part 'agent_provider_model.freezed.dart';
part 'agent_provider_model.g.dart';

@freezed
abstract class AgentProviderModel with _$AgentProviderModel {
  @JsonSerializable(explicitToJson: true)
  const factory AgentProviderModel({
    String? serviceProviderNameAr,
    String? serviceProviderNameEn,
    required String mobileNumber1,
    String? mobileNumber2,
    String? contactPersonName,
    String? notes,
    required Map<String, dynamic> image,
    required double lat,
    required double lng,
    required int districtId,
    required int typeId,
    List<int>? categoryIds,
  }) = _AgentProviderModel;

  factory AgentProviderModel.fromJson(Map<String, Object?> json) =>
      _$AgentProviderModelFromJson(json);
}
