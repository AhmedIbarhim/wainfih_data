class DetailsModel {
  String? name;
  String? category;
  String? description;
  String? email;
  String? phone;
  String? address;
  String? city;

  DetailsModel({
    this.name,
    this.category,
    this.description,
    this.email,
    this.phone,
    this.address,
    this.city,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'email': email,
      'phone': phone,
      'address': address,
      'city': city,
    };
  }

  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
    );
  }
}
