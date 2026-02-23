import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_client.dart';
import '../models/user_model.dart';

class AuthRepo {
  final APIClient apiClient;

  AuthRepo(this.apiClient);

  Future<Either<Failure, String>> sendOtp({
    required String mobileNumber,
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/sendOtp',
        data: {'mobileNumber': mobileNumber},
      );
      // Assuming the response contains some message or success status
      return right("OTP sent successfully");
    } on DioException catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    } catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    }
  }

  Future<Either<Failure, String>> register({
    required String mobileNumber,
    required String username,
  }) async {
    try {
      await apiClient.post(
        '/auth/mobileSignUp',
        data: {'mobileNumber': mobileNumber, 'username': username},
      );
      return right("Registration successful, OTP sent");
    } on DioException catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    } catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    }
  }

  Future<Either<Failure, AuthResponseModel>> verifyMobile({
    required String mobileNumber,
    required String otp,
  }) async {
    try {
      final response = await apiClient.post(
        '/auth/verifyMobile',
        data: {'mobileNumber': mobileNumber, 'otp': int.tryParse(otp) ?? 0},
      );
      return right(AuthResponseModel.fromJson(response.data));
    } on DioException catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    } catch (e) {
      return left(ServerFailure(FailureInfo(exception: e.toString())));
    }
  }
}
