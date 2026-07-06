import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const AuthModel._();

  @JsonSerializable(explicitToJson: true)
  const factory AuthModel({required String token, required UserModel user}) =
      _AuthModel;

  factory AuthModel.fromJson(Map<String, Object?> json) =>
      _$AuthModelFromJson(json);

  factory AuthModel.fromSignInResponse(Map<String, dynamic> json) {
    return AuthModel(
      token: json['token'] as String,
      user: UserModel(
        id: json['id'] as String,
        email: json['email'] as String,
        username: json['username'] as String,
        mobileNumber: json['mobileNumber'] as String,
        role: json['role'] as String,
      ),
    );
  }

  bool get isFieldAgent => user.role == 'field-agent';
  bool get isTokenExpired => JwtDecoder.isExpired(token);
}
