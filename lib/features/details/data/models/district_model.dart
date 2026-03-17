import 'package:equatable/equatable.dart';
import 'city_model.dart';

class DistrictModel extends Equatable {
  int id;
  String districtNameAr;
  String districtNameEn;
  int cityId;
  CityModel? city;

  DistrictModel({
    required this.id,
    required this.districtNameAr,
    required this.districtNameEn,
    required this.cityId,
    this.city,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) => DistrictModel(
    id: json["id"] as int? ?? 0,
    districtNameAr: json["districtNameAr"] as String? ?? '',
    districtNameEn: json["districtNameEn"] as String? ?? '',
    cityId: json["cityId"] as int? ?? 0,
    city: json["city"] == null ? null : CityModel.fromJson(json["city"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "districtNameAr": districtNameAr,
    "districtNameEn": districtNameEn,
    "cityId": cityId,
    "city": city?.toJson(),
  };

  @override
  List<Object?> get props => [id, districtNameAr, districtNameEn, cityId, city];
}
