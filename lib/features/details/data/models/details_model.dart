import 'city_model.dart';

class DetailsModel {
  String? nameAr;
  String? nameEn;
  String? category;
  String? description;
  String? email;
  String? phone;
  String? address;
  CityModel? city;

  DetailsModel({
    this.nameAr,
    this.nameEn,
    this.category,
    this.description,
    this.email,
    this.phone,
    this.address,
    this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'nameAr': nameAr,
      'nameEn': nameEn,
      'category': category,
      'description': description,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city?.toJson(),
    };
  }

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      nameAr: json['nameAr'],
      nameEn: json['nameEn'],
      category: json['category'],
      description: json['description'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: CityModel.fromJson(json['city']),
    );
  }
}
