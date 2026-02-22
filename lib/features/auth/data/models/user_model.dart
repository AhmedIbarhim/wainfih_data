import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.username,
    required this.mobileNumber,

    required this.mobileNumberVerified,
    this.image,
  });

  final String id;
  final String username;
  final String mobileNumber;

  final bool mobileNumberVerified;
  final Map<String, dynamic>? image;

  @override
  List<Object?> get props => [
    id,
    username,
    mobileNumber,
    mobileNumberVerified,
    image,
  ];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      mobileNumber: json['mobileNumber'] as String? ?? '',
      mobileNumberVerified: json['mobileNumberVerified'] as bool? ?? false,
      image: json['image'] as Map<String, dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'mobileNumber': mobileNumber,
    'mobileNumberVerified': mobileNumberVerified,
    'image': image,
  };
}

class AuthResponseModel {
  final String token;
  final UserModel user;

  AuthResponseModel({required this.token, required this.user});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      token: json['token'] as String? ?? '',
      user: UserModel.fromJson(json),
    );
  }
}
