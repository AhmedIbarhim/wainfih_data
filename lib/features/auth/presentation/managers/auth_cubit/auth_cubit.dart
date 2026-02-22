import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repos/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  String? _currentMobileNumber;

  Future<void> sendOtp(String mobileNumber) async {
    _currentMobileNumber = mobileNumber;
    emit(AuthLoading());
    final result = await authRepo.sendOtp(mobileNumber: mobileNumber);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(OtpSentSuccess(success)),
    );
  }

  Future<void> resendOtp() async {
    if (_currentMobileNumber == null) return;
    emit(AuthLoading());
    final result = await authRepo.sendOtp(mobileNumber: _currentMobileNumber!);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(OtpResentSuccess(success)),
    );
  }

  Future<void> register({
    required String mobileNumber,
    required String username,
  }) async {
    _currentMobileNumber = mobileNumber;
    emit(AuthLoading());
    final result = await authRepo.register(
      mobileNumber: mobileNumber,
      username: username,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(OtpSentSuccess(success)),
    );
  }

  Future<void> verifyOtp(String otp) async {
    if (_currentMobileNumber == null) {
      emit(AuthFailure("Mobile number is missing"));
      return;
    }
    emit(AuthLoading());
    final result = await authRepo.verifyMobile(
      mobileNumber: _currentMobileNumber!,
      otp: otp,
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess(success)),
    );
  }
}
