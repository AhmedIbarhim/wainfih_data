import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/location_repo.dart';
import 'location_states.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo repository;

  LocationCubit(this.repository) : super(LocationInitial());

  Future<void> getCurrentLocation() async {
    emit(LocationLoading());

    final result = await repository.getCurrentLocation();

    result.fold(
      (failure) => emit(LocationError(failure.message)),
      (location) => emit(LocationSuccess(location)),
    );
  }
}
