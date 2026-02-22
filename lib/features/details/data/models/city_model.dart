class CityModel {
  CityModel({
    required this.id,
    required this.cityNameAr,
    required this.cityNameEn,
  });

  int id;
  String cityNameAr;
  String cityNameEn;

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json["id"],
      cityNameAr: json["cityNameAr"],
      cityNameEn: json["cityNameEn"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "cityNameAr": cityNameAr, "cityNameEn": cityNameEn};
  }

  // String name(BuildContext context) {
  //   if (context.isEn) {
  //     return cityNameEn;
  //   }
  //   return cityNameAr;
  // }
}
