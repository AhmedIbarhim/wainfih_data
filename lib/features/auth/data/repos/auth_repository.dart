import 'package:dartz/dartz.dart';

import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

class AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  AuthRepository(this._remoteDataSource, this._localDataSource);

  Future<Either<String, AuthModel>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );
    return result.fold(
      (error) => left(error),
      (authModel) async {
        if (!authModel.isFieldAgent) {
          return left('هذا الحساب غير مصرح له');
        }
        await _localDataSource.saveToken(authModel);
        return right(authModel);
      },
    );
  }

  Future<bool> get isLoggedIn => _localDataSource.isLoggedIn;

  Future<bool> get isTokenValid async {
    final token = await _localDataSource.token;
    if (token == null) return false;
    return _localDataSource.isTokenValid;
  }

  Future<void> logout() => _localDataSource.logout();

  Future<AuthModel?> get currentUser => _localDataSource.authModel;
}
