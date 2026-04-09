import 'package:dartz/dartz.dart';

import '../../../../core/models/paged_response.dart';
import '../data_sources/my_providers_remote_data_source.dart';
import '../models/provider_list_model.dart';

class MyProvidersRepository {
  final MyProvidersRemoteDataSource _remoteDataSource;

  MyProvidersRepository(this._remoteDataSource);

  Future<Either<String, PagedResponse<ProviderListModel>>> getMyProviders({
    required int page,
    int take = 10,
    String? stateFilter,
  }) =>
      _remoteDataSource.getMyProviders(
        page: page,
        take: take,
        stateFilter: stateFilter,
      );

  Future<Either<String, ProviderListModel>> getProviderById(int id) =>
      _remoteDataSource.getProviderById(id);
}
