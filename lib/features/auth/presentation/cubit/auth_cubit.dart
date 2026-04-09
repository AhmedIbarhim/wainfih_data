import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await _authRepository.signIn(
      email: email,
      password: password,
    );
    result.fold(
      (error) => emit(AuthFailure(error)),
      (authModel) => emit(AuthSuccess(authModel)),
    );
  }

  Future<void> checkSession() async {
    final isValid = await _authRepository.isTokenValid;
    if (isValid) {
      final user = await _authRepository.currentUser;
      if (user != null) {
        emit(AuthSuccess(user));
        return;
      }
    }
    emit(AuthLoggedOut());
  }

  Future<void> logout() async {
    await _authRepository.logout();
    emit(AuthLoggedOut());
  }
}
