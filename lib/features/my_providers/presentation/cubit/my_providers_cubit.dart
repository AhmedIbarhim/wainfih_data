import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/fitler_period_enum.dart';
import '../../data/repos/my_providers_repository.dart';
import 'my_providers_state.dart';

class MyProvidersCubit extends Cubit<MyProvidersState> {
  final MyProvidersRepository _repository;

  MyProvidersCubit(this._repository) : super(const MyProvidersState());

  Future<void> loadProviders({bool refresh = false}) async {
    if (state.isLoading) return;

    final page = refresh ? 1 : state.currentPage;
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _repository.getMyProviders(
      page: page,
      stateFilter: state.activeFilter,
    );

    result.fold(
      (error) => emit(state.copyWith(isLoading: false, error: error)),
      (paged) {
        final providers = refresh
            ? paged.content
            : [...state.providers, ...paged.content];
        emit(
          state.copyWith(
            providers: providers,
            isLoading: false,
            hasMore: paged.hasNextPage,
            currentPage: page + 1,
          ),
        );
      },
    );
  }

  void setFilter(String? filter) {
    emit(state.copyWith(activeFilter: filter));
    loadProviders(refresh: true);
  }

  void setPeriod(FilterPeriod period) {
    emit(state.copyWith(activePeriod: period));
  }

  Future<void> refresh() => loadProviders(refresh: true);

  Future<void> loadMore() {
    if (!state.hasMore || state.isLoading) return Future.value();
    return loadProviders();
  }
}
