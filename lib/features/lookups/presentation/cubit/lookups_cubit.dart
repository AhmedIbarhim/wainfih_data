import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/data_sources/lookups_local_data_source.dart';
import '../../data/data_sources/lookups_remote_data_source.dart';
import '../../data/models/district_model.dart';
import 'lookups_state.dart';

class LookupsCubit extends Cubit<LookupsState> {
  final LookupsRemoteDataSource _remoteDataSource;
  final LookupsLocalDataSource _localDataSource;

  List<DistrictModel> _allDistricts = [];

  LookupsCubit(this._remoteDataSource, this._localDataSource)
    : super(const LookupsState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(isLoading: true));

    // 1. Load from cache first
    final cache = await _localDataSource.loadCache();
    if (cache != null) {
      _allDistricts = cache.districts;
      emit(
        state.copyWith(
          isLoading: false,
          cities: cache.cities,
          categories: cache.categories,
        ),
      );
    }

    // 2. Refresh from network in background
    await _refreshFromNetwork();
  }

  Future<void> _refreshFromNetwork() async {
    try {
      // Fetch all three lookups independently — a failure in one must not
      // wipe out the others. Each falls back to its existing cached value.
      final (citiesRes, districtsRes, categoriesRes) = await (
        _remoteDataSource.getCities(),
        _remoteDataSource.getAllDistricts(),
        _remoteDataSource.getLeafCategories(),
      ).wait;

      final cities = citiesRes.getOrElse(() => state.cities);
      _allDistricts = districtsRes.getOrElse(() => _allDistricts);
      final categories = categoriesRes.getOrElse(() => state.categories);

      emit(
        state.copyWith(
          isLoading: false,
          cities: cities,
          categories: categories,
        ),
      );

      // Save the combined result to local cache for offline use.
      _localDataSource.saveCache(
        LookupsCache(
          cities: cities,
          districts: _allDistricts,
          categories: categories,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> loadDistrictsForCity(int cityId) async {
    // Filter from cached all-districts list — works offline
    final filtered = _allDistricts.where((d) => d.cityId == cityId).toList();
    emit(state.copyWith(districts: filtered));

    // If we have no cached districts, try network
    if (filtered.isEmpty) {
      emit(state.copyWith(isLoading: true));
      final result = await _remoteDataSource.getDistrictsByCityId(cityId);
      result.fold(
        (error) => emit(state.copyWith(isLoading: false, error: error)),
        (districts) =>
            emit(state.copyWith(isLoading: false, districts: districts)),
      );
    }
  }

  Future<void> detectDistrictFromCoordinates({
    required double lat,
    required double lng,
  }) async {
    final result = await _remoteDataSource.getDistrictByCoordinates(
      lat: lat,
      lng: lng,
    );
    result.fold((_) => {}, (district) {
      emit(state.copyWith(autoDetectedDistrict: district));
      if (district.cityId > 0) {
        loadDistrictsForCity(district.cityId);
      }
    });
  }
}
