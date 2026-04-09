import 'dart:io';

import 'package:dartz/dartz.dart';

import '../data_sources/provider_remote_data_source.dart';
import '../models/agent_provider_model.dart';

class ProviderSubmissionRepository {
  final ProviderRemoteDataSource _remoteDataSource;

  ProviderSubmissionRepository(this._remoteDataSource);

  Future<Either<String, Map<String, dynamic>>> uploadImage(File file) =>
      _remoteDataSource.uploadImage(file);

  Future<Either<String, int>> submitProvider(AgentProviderModel payload) =>
      _remoteDataSource.submitProvider(payload);

  Future<Either<String, int>> updateProvider(int id, AgentProviderModel payload) =>
      _remoteDataSource.updateProvider(id, payload);
}
