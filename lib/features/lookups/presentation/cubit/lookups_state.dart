import 'package:equatable/equatable.dart';
import '../../data/models/category_model.dart';
import '../../data/models/city_model.dart';
import '../../data/models/district_model.dart';
import '../../data/models/sp_type_model.dart';

class LookupsState extends Equatable {
  final List<CityModel> cities;
  final List<DistrictModel> districts;
  final List<SpTypeModel> serviceTypes;
  final List<CategoryModel> categories;
  final DistrictModel? autoDetectedDistrict;
  final bool isLoading;
  final String? error;

  const LookupsState({
    this.cities = const [],
    this.districts = const [],
    this.serviceTypes = const [],
    this.categories = const [],
    this.autoDetectedDistrict,
    this.isLoading = false,
    this.error,
  });

  LookupsState copyWith({
    List<CityModel>? cities,
    List<DistrictModel>? districts,
    List<SpTypeModel>? serviceTypes,
    List<CategoryModel>? categories,
    DistrictModel? autoDetectedDistrict,
    bool clearAutoDetectedDistrict = false,
    bool? isLoading,
    String? error,
  }) {
    return LookupsState(
      cities: cities ?? this.cities,
      districts: districts ?? this.districts,
      serviceTypes: serviceTypes ?? this.serviceTypes,
      categories: categories ?? this.categories,
      autoDetectedDistrict: clearAutoDetectedDistrict
          ? null
          : (autoDetectedDistrict ?? this.autoDetectedDistrict),
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        cities,
        districts,
        serviceTypes,
        categories,
        autoDetectedDistrict,
        isLoading,
        error,
      ];
}
