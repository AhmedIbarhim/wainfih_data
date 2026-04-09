import '../../../data/models/auth_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class OtpSentSuccess extends AuthState {
  final String message;
  OtpSentSuccess(this.message);
}

class OtpResentSuccess extends AuthState {
  final String message;
  OtpResentSuccess(this.message);
}

class AuthSuccess extends AuthState {
  final AuthModel authResponse;
  AuthSuccess(this.authResponse);
}

class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}
