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
      emit(state.copyWith(
        isLoading: false,
        cities: cache.cities,
        serviceTypes: cache.serviceTypes,
        categories: cache.categories,
      ));
    }

    // 2. Refresh from network in background
    await _refreshFromNetwork();
  }

  Future<void> _refreshFromNetwork() async {
    try {
      final citiesResult = await _remoteDataSource.getCities();
      final typesResult = await _remoteDataSource.getServiceProviderTypes();
      final categoriesResult = await _remoteDataSource.getCategories();
      final districtsResult = await _remoteDataSource.getAllDistricts();

      final cities = citiesResult.fold((_) => state.cities, (c) => c);
      final types = typesResult.fold((_) => state.serviceTypes, (t) => t);
      final categories =
          categoriesResult.fold((_) => state.categories, (c) => c);
      final districts =
          districtsResult.fold((_) => _allDistricts, (d) => d);

      _allDistricts = districts;

      emit(state.copyWith(
        isLoading: false,
        cities: cities,
        serviceTypes: types,
        categories: categories,
      ));

      // Save to cache
      await _localDataSource.saveCache(LookupsCache(
        cities: cities,
        districts: districts,
        serviceTypes: types,
        categories: categories,
      ));
    } catch (_) {
      // Network failed — cached data is already in state, that's fine
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
    result.fold(
      (_) => {},
      (district) {
        emit(state.copyWith(autoDetectedDistrict: district));
        if (district.cityId > 0) {
          loadDistrictsForCity(district.cityId);
        }
      },
    );
  }
}
