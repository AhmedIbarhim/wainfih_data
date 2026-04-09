import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/networking/api_client.dart';
import '../models/auth_model.dart';

class AuthRemoteDataSource {
  final APIClient _apiClient;

  AuthRemoteDataSource(this._apiClient);

  Future<Either<String, AuthModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiClient.post(
        '/auth/signIn',
        data: {'email': email, 'password': password},
      );
      final authModel = AuthModel.fromSignInResponse(
        response.data as Map<String, dynamic>,
      );
      return right(authModel);
    } on DioException catch (e) {
      final message = e.response?.data?['message'] ?? e.message ?? 'Login failed';
      return left(message is List ? message.first.toString() : message.toString());
    }
  }
}
