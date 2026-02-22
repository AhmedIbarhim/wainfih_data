part of 'fields_cubit.dart';

@immutable
sealed class FieldsState {}

final class FieldsInitial extends FieldsState {}

final class GetCitiesLoading extends FieldsState {}

final class GetCitiesSuccess extends FieldsState {
  final List<CityModel> cities;
  GetCitiesSuccess(this.cities);
}

final class GetCitiesFailure extends FieldsState {
  final String errMessage;
  GetCitiesFailure(this.errMessage);
}
