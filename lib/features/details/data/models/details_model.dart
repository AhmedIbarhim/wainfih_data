import 'district_model.dart';

class DetailsModel {
  String? serviceProviderNameAr;
  String? serviceProviderNameEn;
  String? category;
  String? description;
  String? email;
  String? mobileNumber1;
  String? mobileNumber2;
  String? websiteUrl;
  String? address;
  DistrictModel? district;
  int? taxId;
  int? vatNumber;
  String? eoriNumber;
  int? postcode;

  DetailsModel({
    this.serviceProviderNameAr,
    this.serviceProviderNameEn,
    this.category,
    this.description,
    this.email,
    this.mobileNumber1,
    this.mobileNumber2,
    this.websiteUrl,
    this.address,
    this.district,
    this.taxId,
    this.vatNumber,
    this.eoriNumber,
    this.postcode,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceProviderNameAr': serviceProviderNameAr,
      'serviceProviderNameEn': serviceProviderNameEn,
      'category': category,
      'description': description,
      'email': email,
      'mobileNumber1': mobileNumber1,
      'mobileNumber2': mobileNumber2,
      'websiteUrl': websiteUrl,
      'address': address,
      'district': district?.toJson(),
      'taxId': taxId,
      'vatNumber': vatNumber,
      'eoriNumber': eoriNumber,
      'postcode': postcode,
    };
  }

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      serviceProviderNameAr: json['serviceProviderNameAr'],
      serviceProviderNameEn: json['serviceProviderNameEn'],
      category: json['category'],
      description: json['description'],
      email: json['email'],
      mobileNumber1: json['mobileNumber1'],
      mobileNumber2: json['mobileNumber2'],
      websiteUrl: json['websiteUrl'],
      address: json['address'],
      district: json['district'] != null
          ? DistrictModel.fromJson(json['district'])
          : null,
      taxId: json['taxId'],
      vatNumber: json['vatNumber'],
      eoriNumber: json['eoriNumber'],
      postcode: json['postcode'],
    );
  }
}
