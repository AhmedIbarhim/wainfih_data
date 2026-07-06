import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../lookups/data/models/category_model.dart';
import '../../../lookups/data/models/city_model.dart';
import '../../../lookups/data/models/district_model.dart';
import '../../../my_providers/data/models/provider_list_model.dart';
import 'agent_provider_model.dart';

class UpsertProviderUiModel {
  // Step 1: Basic Info
  final TextEditingController nameAr;
  final TextEditingController nameEn;
  final TextEditingController mobile1;
  final TextEditingController mobile2;
  final TextEditingController contactPerson;
  final TextEditingController notes;

  // Step 2: Photo & Location
  final ValueNotifier<File?> imageFile;
  final ValueNotifier<Map<String, dynamic>?> imageJson;
  final ValueNotifier<LatLng?> location;

  // Step 3: Classification
  final ValueNotifier<CategoryModel?> selectedCategory;
  final ValueNotifier<CityModel?> selectedCity;
  final ValueNotifier<DistrictModel?> selectedDistrict;

  // Editing context
  final int? existingId;

  UpsertProviderUiModel._({
    required this.nameAr,
    required this.nameEn,
    required this.mobile1,
    required this.mobile2,
    required this.contactPerson,
    required this.notes,
    required this.imageFile,
    required this.imageJson,
    required this.location,
    required this.selectedCategory,
    required this.selectedCity,
    required this.selectedDistrict,
    this.existingId,
  });

  factory UpsertProviderUiModel.create() {
    return UpsertProviderUiModel._(
      nameAr: TextEditingController(),
      nameEn: TextEditingController(),
      mobile1: TextEditingController(),
      mobile2: TextEditingController(),
      contactPerson: TextEditingController(),
      notes: TextEditingController(),
      imageFile: ValueNotifier(null),
      imageJson: ValueNotifier(null),
      location: ValueNotifier(null),
      selectedCategory: ValueNotifier(null),
      selectedCity: ValueNotifier(null),
      selectedDistrict: ValueNotifier(null),
    );
  }

  factory UpsertProviderUiModel.fromProvider(ProviderListModel provider) {
    return UpsertProviderUiModel._(
      nameAr: TextEditingController(text: provider.serviceProviderNameAr ?? ''),
      nameEn: TextEditingController(text: provider.serviceProviderNameEn ?? ''),
      mobile1: TextEditingController(text: provider.mobileNumber1 ?? ''),
      mobile2: TextEditingController(text: provider.mobileNumber2 ?? ''),
      contactPerson: TextEditingController(text: provider.contactPersonName ?? ''),
      notes: TextEditingController(text: provider.notes ?? ''),
      imageFile: ValueNotifier(null),
      imageJson: ValueNotifier(provider.image),
      location: ValueNotifier(
        provider.lat != null && provider.lng != null
            ? LatLng(provider.lat!, provider.lng!)
            : null,
      ),
      selectedCategory: ValueNotifier(
        provider.categories != null && provider.categories!.isNotEmpty
            ? provider.categories!.first
            : null,
      ),
      selectedCity: ValueNotifier(provider.district?.city),
      selectedDistrict: ValueNotifier(provider.district),
      existingId: provider.id,
    );
  }

  bool get isEditing => existingId != null;

  AgentProviderModel toPayload() {
    return AgentProviderModel(
      serviceProviderNameAr:
          nameAr.text.isNotEmpty ? nameAr.text : null,
      serviceProviderNameEn:
          nameEn.text.isNotEmpty ? nameEn.text : null,
      mobileNumber1: mobile1.text,
      mobileNumber2: mobile2.text.isNotEmpty ? mobile2.text : null,
      contactPersonName:
          contactPerson.text.isNotEmpty ? contactPerson.text : null,
      notes: notes.text.isNotEmpty ? notes.text : null,
      image: imageJson.value ?? {},
      lat: location.value!.latitude,
      lng: location.value!.longitude,
      districtId: selectedDistrict.value?.id,
      typeId: null,
      categoryIds: selectedCategory.value != null
          ? [selectedCategory.value!.id]
          : null,
    );
  }

  void dispose() {
    nameAr.dispose();
    nameEn.dispose();
    mobile1.dispose();
    mobile2.dispose();
    contactPerson.dispose();
    notes.dispose();
    imageFile.dispose();
    imageJson.dispose();
    location.dispose();
    selectedCategory.dispose();
    selectedCity.dispose();
    selectedDistrict.dispose();
  }
}
