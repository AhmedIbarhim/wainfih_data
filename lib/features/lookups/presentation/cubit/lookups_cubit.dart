import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repos/lookups_repository.dart';
import 'lookups_state.dart';

class LookupsCubit extends Cubit<LookupsState> {
  final LookupsRepository _repository;

  LookupsCubit(this._repository) : super(const LookupsState());

  Future<void> loadInitialData() async {
    emit(state.copyWith(isLoading: true));

    final citiesResult = await _repository.getCities();
    final typesResult = await _repository.getServiceProviderTypes();
    final categoriesResult = await _repository.getCategories();

    emit(state.copyWith(
      isLoading: false,
      cities: citiesResult.fold((_) => [], (cities) => cities),
      serviceTypes: typesResult.fold((_) => [], (types) => types),
      categories: categoriesResult.fold((_) => [], (cats) => cats),
      error: citiesResult.fold((e) => e, (_) => null),
    ));
  }

  Future<void> loadDistrictsForCity(int cityId) async {
    emit(state.copyWith(districts: [], isLoading: true));
    final result = await _repository.getDistrictsByCityId(cityId);
    result.fold(
      (error) => emit(state.copyWith(isLoading: false, error: error)),
      (districts) => emit(state.copyWith(isLoading: false, districts: districts)),
    );
  }

  Future<void> detectDistrictFromCoordinates({
    required double lat,
    required double lng,
  }) async {
    final result = await _repository.getDistrictByCoordinates(
      lat: lat,
      lng: lng,
    );
    result.fold(
      (_) => {}, // Silently fail — agent fills manually
      (district) {
        emit(state.copyWith(autoDetectedDistrict: district));
        // Also load districts for the detected city
        if (district.cityId > 0) {
          loadDistrictsForCity(district.cityId);
        }
      },
    );
  }
}
