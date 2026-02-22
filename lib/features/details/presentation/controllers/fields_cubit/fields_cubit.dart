import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/city_model.dart';
import '../../../data/repos/fields_repo.dart';

part 'fields_state.dart';

class FieldsCubit extends Cubit<FieldsState> {
  FieldsCubit(this._fieldsRepo) : super(FieldsInitial());

  final FieldsRepo _fieldsRepo;

  List<CityModel> cities = [];

  Future<void> getCities() async {
    if (cities.isNotEmpty) return;
    emit(GetCitiesLoading());
    final result = await _fieldsRepo.getAllCities();
    result.fold((l) => emit(GetCitiesFailure(l.toString())), (r) {
      cities = r;
      emit(GetCitiesSuccess(r));
    });
  }
}
