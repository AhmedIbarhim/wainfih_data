import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/components/main_button.dart';
import '../../../../core/helpers/handle_location_permission.dart';
import '../../../../core/route/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/upsert_provider_ui_model.dart';
import '../cubit/add_provider_cubit.dart';
import '../cubit/add_provider_state.dart';
import '../../../images/presentation/widgets/image_field.dart';
import '../../../lookups/data/models/category_model.dart';
import '../../../lookups/data/models/city_model.dart';
import '../../../lookups/data/models/district_model.dart';
import '../../../lookups/data/models/sp_type_model.dart';
import '../../../lookups/presentation/cubit/lookups_cubit.dart';
import '../../../lookups/presentation/cubit/lookups_state.dart';
import '../../../map/data/location_remote_data_source.dart';
import '../../../map/data/location_repo_impl.dart';
import '../../../map/presentation/manager/location_cubit.dart';
import '../../../map/presentation/manager/location_states.dart';
import '../../../my_providers/data/models/provider_list_model.dart';
import '../widgets/adding_provider_steps.dart';

class AddProviderView extends StatefulWidget {
  const AddProviderView({super.key, this.provider});

  final ProviderListModel? provider;

  @override
  State<AddProviderView> createState() => _AddProviderViewState();
}

class _AddProviderViewState extends State<AddProviderView> {
  late UpsertProviderUiModel uiModel;
  late PageController pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    uiModel = widget.provider != null
        ? UpsertProviderUiModel.fromProvider(widget.provider!)
        : UpsertProviderUiModel.create();
    pageController = PageController();
    pageController.addListener(() {
      final page = pageController.page?.toInt();
      if (page != null && page != currentIndex) {
        setState(() => currentIndex = page);
      }
    });
  }

  @override
  void dispose() {
    uiModel.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    final title = uiModel.isEditing ? l.editButton : l.addProviderTitle;

    return BlocListener<AddProviderCubit, AddProviderState>(
      listener: (context, state) {
        if (state is AddProviderSubmitSuccess) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            Routes.myProviders,
            (route) => route.settings.name == Routes.home,
          );
        } else if (state is AddProviderQueuedOffline) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l.queuedOfflineMessage)));
          Navigator.of(
            context,
          ).pushNamedAndRemoveUntil(Routes.home, (route) => false);
        } else if (state is AddProviderSubmitFailed) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          _handleBack(context);
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title, style: AppTextStyles.bold19),
            leading: InkWell(
              onTap: () => _handleBack(context),
              child: const Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                AddingProviderSteps(
                  currentIndex: currentIndex,
                  pageController: pageController,
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _Step1BasicInfo(uiModel: uiModel),
                      _Step2PhotoAndLocation(uiModel: uiModel),
                      _Step3Classification(uiModel: uiModel),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<AddProviderCubit, AddProviderState>(
                  builder: (context, state) {
                    final isSubmitting = state is AddProviderSubmitting;
                    final isUploading = state is AddProviderImageUploading;
                    return MainButton(
                      text: currentIndex == 2 ? l.submitButton : l.nextButton,
                      isLoading: isSubmitting || isUploading,
                      onTap: () => _handleNext(context),
                    );
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleNext(BuildContext context) {
    final l = S.of(context);
    if (currentIndex == 0) {
      // Validate basic info
      if (uiModel.nameAr.text.isEmpty && uiModel.nameEn.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationAtLeastOneName)));
        return;
      }
      if (uiModel.mobile1.text.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationMobileRequired)));
        return;
      }
      _moveToNextStep();
    } else if (currentIndex == 1) {
      // Validate photo and location
      if (uiModel.imageFile.value == null && uiModel.imageJson.value == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationImageRequired)));
        return;
      }
      if (uiModel.location.value == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationLocationRequired)));
        return;
      }
      _moveToNextStep();
    } else {
      // Validate classification and submit
      if (uiModel.selectedType.value == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationTypeRequired)));
        return;
      }
      if (uiModel.selectedDistrict.value == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationDistrictRequired)));
        return;
      }
      if (uiModel.selectedCategories.value.isEmpty) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l.validationCategoriesRequired)));
        return;
      }
      context.read<AddProviderCubit>().submit(uiModel);
    }
  }

  void _moveToNextStep() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  }

  void _handleBack(BuildContext context) {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeIn,
      );
    } else {
      _showExitConfirmation(context);
    }
  }

  void _showExitConfirmation(BuildContext context) {
    final l = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l.confirm),
        content: Text(l.exitConfirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: Text(l.confirm),
          ),
        ],
      ),
    );
  }
}

// --- Step 1: Basic Info ---
class _Step1BasicInfo extends StatelessWidget {
  const _Step1BasicInfo({required this.uiModel});

  final UpsertProviderUiModel uiModel;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            controller: uiModel.nameAr,
            label: l.providerNameAr,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: uiModel.nameEn,
            label: l.providerNameEn,
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: uiModel.mobile1,
            label: l.mobileNumber,
            keyboardType: TextInputType.phone,
            suffixIcon: const Icon(Icons.phone_android),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: uiModel.mobile2,
            label: l.secondMobile,
            keyboardType: TextInputType.phone,
            suffixIcon: const Icon(Icons.phone_android),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            controller: uiModel.contactPerson,
            label: l.contactPerson,
            suffixIcon: const Icon(Icons.person_outline),
          ),
          const SizedBox(height: 16),
          CustomTextFormField(controller: uiModel.notes, label: l.notes),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// --- Step 2: Photo & Location ---
class _Step2PhotoAndLocation extends StatefulWidget {
  const _Step2PhotoAndLocation({required this.uiModel});

  final UpsertProviderUiModel uiModel;

  @override
  State<_Step2PhotoAndLocation> createState() => _Step2PhotoAndLocationState();
}

class _Step2PhotoAndLocationState extends State<_Step2PhotoAndLocation>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final Completer<GoogleMapController> _mapController = Completer();
  late LocationCubit _locationCubit;
  double _currentZoom = 15.0;
  LatLng? _lastCameraTarget;

  @override
  void initState() {
    super.initState();
    _locationCubit = LocationCubit(
      LocationRepoImpl(LocationRemoteDataSourceImpl()),
    );
    // Request permission first, then get location
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final hasPermission = await handleLocationPermission(context);
      if (hasPermission) {
        _locationCubit.getCurrentLocation();
      }
    });
  }

  @override
  void dispose() {
    _locationCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = S.of(context);
    final uiModel = widget.uiModel;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(l.takePhoto, style: AppTextStyles.bold16),
          const SizedBox(height: 8),
          ImageField(
            initialImage: uiModel.imageFile.value,
            onFileChanged: (file) {
              uiModel.imageFile.value = file;
              // Clear any previously uploaded image json so we re-upload
              uiModel.imageJson.value = null;
            },
          ),
          const SizedBox(height: 20),
          Text(l.selectLocation, style: AppTextStyles.bold16),
          const SizedBox(height: 8),
          SizedBox(
            height: 300,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: BlocProvider.value(
                value: _locationCubit,
                child: BlocConsumer<LocationCubit, LocationState>(
                  listener: (context, state) {
                    if (state is LocationSuccess &&
                        uiModel.location.value == null) {
                      uiModel.location.value = LatLng(
                        state.location.latitude,
                        state.location.longitude,
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is LocationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is LocationError) {
                      return Center(child: Text(state.message));
                    }

                    final pos =
                        uiModel.location.value ??
                        const LatLng(24.7136, 46.6753); // Default Riyadh

                    return Stack(
                      children: [
                        GoogleMap(
                          gestureRecognizers: {
                            Factory<OneSequenceGestureRecognizer>(
                              () => EagerGestureRecognizer(),
                            ),
                          },
                          initialCameraPosition: CameraPosition(
                            target: pos,
                            zoom: _currentZoom,
                          ),
                          onMapCreated: (controller) {
                            if (!_mapController.isCompleted) {
                              _mapController.complete(controller);
                            }
                          },
                          onCameraMove: (position) {
                            _currentZoom = position.zoom;
                            _lastCameraTarget = position.target;
                          },
                          onCameraIdle: () {
                            if (_lastCameraTarget != null && mounted) {
                              uiModel.location.value = _lastCameraTarget;
                              context
                                  .read<LookupsCubit>()
                                  .detectDistrictFromCoordinates(
                                    lat: _lastCameraTarget!.latitude,
                                    lng: _lastCameraTarget!.longitude,
                                  );
                            }
                          },
                        ),
                        // Center pin overlay — pin tip marks the selected location
                        const Positioned.fill(
                          child: IgnorePointer(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 36),
                                child: Icon(
                                  Icons.location_on,
                                  size: 48,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: FloatingActionButton(
                            mini: true,
                            backgroundColor: Colors.white60,
                            // Re-reads GPS directly (not through the cubit) so
                            // the map widget isn't unmounted by a Loading state.
                            onPressed: () async {
                              try {
                                final pos = await Geolocator.getCurrentPosition(
                                  locationSettings: const LocationSettings(
                                    accuracy: LocationAccuracy.high,
                                  ),
                                );
                                final loc = LatLng(pos.latitude, pos.longitude);
                                if (!mounted) return;
                                uiModel.location.value = loc;
                                if (!_mapController.isCompleted) return;
                                final controller = await _mapController.future;
                                controller.animateCamera(
                                  CameraUpdate.newLatLngZoom(loc, _currentZoom),
                                );
                              } catch (_) {
                                _locationCubit.getCurrentLocation();
                              }
                            },
                            child: const Icon(
                              Icons.my_location,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// --- Step 3: Classification ---
class _Step3Classification extends StatefulWidget {
  const _Step3Classification({required this.uiModel});

  final UpsertProviderUiModel uiModel;

  @override
  State<_Step3Classification> createState() => _Step3ClassificationState();
}

class _Step3ClassificationState extends State<_Step3Classification>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int? _lastAutoFilledDistrictId;

  @override
  void initState() {
    super.initState();
    // Check if auto-detect already happened while we weren't listening
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = context.read<LookupsCubit>().state;
      if (state.autoDetectedDistrict != null &&
          _lastAutoFilledDistrictId == null) {
        final detected = state.autoDetectedDistrict!;
        widget.uiModel.selectedDistrict.value = detected;
        if (detected.city != null) {
          widget.uiModel.selectedCity.value = detected.city;
        } else {
          final city = state.cities.where((c) => c.id == detected.cityId);
          if (city.isNotEmpty) {
            widget.uiModel.selectedCity.value = city.first;
          }
        }
        _lastAutoFilledDistrictId = detected.id;
        if (mounted) setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final l = S.of(context);
    final uiModel = widget.uiModel;

    return BlocConsumer<LookupsCubit, LookupsState>(
      listener: (context, state) {
        // Auto-fill city/district from auto-detected district
        if (state.autoDetectedDistrict != null &&
            state.autoDetectedDistrict!.id != _lastAutoFilledDistrictId) {
          final detected = state.autoDetectedDistrict!;
          uiModel.selectedDistrict.value = detected;
          if (detected.city != null) {
            uiModel.selectedCity.value = detected.city;
          } else {
            // Find city from lookup list
            final city = state.cities.where((c) => c.id == detected.cityId);
            if (city.isNotEmpty) {
              uiModel.selectedCity.value = city.first;
            }
          }
          _lastAutoFilledDistrictId = detected.id;
          setState(() {});
        }
      },
      builder: (context, state) {
        if (state.isLoading && state.serviceTypes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              // Service Type Dropdown
              _SearchableDropdown<SpTypeModel>(
                label: l.serviceType,
                items: state.serviceTypes,
                selectedItem: uiModel.selectedType.value,
                itemLabel: (t) => t.typeNameAr,
                onSelected: (t) {
                  setState(() => uiModel.selectedType.value = t);
                },
              ),
              const SizedBox(height: 16),
              // City Dropdown
              _SearchableDropdown<CityModel>(
                label: l.cityLabel,
                items: state.cities,
                selectedItem: uiModel.selectedCity.value,
                itemLabel: (c) => c.cityNameAr,
                onSelected: (c) {
                  setState(() {
                    uiModel.selectedCity.value = c;
                    uiModel.selectedDistrict.value = null;
                  });
                  if (c != null) {
                    context.read<LookupsCubit>().loadDistrictsForCity(c.id);
                  }
                },
              ),
              const SizedBox(height: 16),
              // District Dropdown
              _SearchableDropdown<DistrictModel>(
                label: l.districtLabel,
                items: state.districts,
                selectedItem: uiModel.selectedDistrict.value,
                itemLabel: (d) => d.districtNameAr,
                enabled: uiModel.selectedCity.value != null && !state.isLoading,
                disabledHint: uiModel.selectedCity.value == null
                    ? l.selectCityFirst
                    : null,
                onSelected: (d) {
                  setState(() => uiModel.selectedDistrict.value = d);
                },
              ),
              const SizedBox(height: 16),
              // Multi-select Categories
              _MultiSelectCategories(
                label: l.categoriesLabel,
                items: state.categories,
                selectedItems: uiModel.selectedCategories.value,
                onChanged: (cats) {
                  setState(() => uiModel.selectedCategories.value = cats);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

// --- Searchable Dropdown Widget ---
class _SearchableDropdown<T> extends StatelessWidget {
  const _SearchableDropdown({
    required this.label,
    required this.items,
    required this.selectedItem,
    required this.itemLabel,
    required this.onSelected,
    this.enabled = true,
    this.disabledHint,
  });

  final String label;
  final List<T> items;
  final T? selectedItem;
  final String Function(T) itemLabel;
  final ValueChanged<T?> onSelected;
  final bool enabled;
  final String? disabledHint;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? () => _showSearchDialog(context) : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.regular11,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: enabled ? Colors.grey : Colors.grey.shade300,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          filled: true,
          fillColor: enabled ? null : Colors.grey.shade100,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          !enabled && disabledHint != null
              ? disabledHint!
              : (selectedItem != null ? itemLabel(selectedItem as T) : ''),
          style: AppTextStyles.regular13.copyWith(
            color: enabled ? null : Colors.grey,
          ),
        ),
      ),
    );
  }

  void _showSearchDialog(BuildContext context) {
    final searchController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        List<T> filtered = List.from(items);
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: Text(label, style: AppTextStyles.bold16),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: label,
                        prefixIcon: const Icon(Icons.search),
                        border: const OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setDialogState(() {
                          filtered = items
                              .where(
                                (item) => itemLabel(
                                  item,
                                ).toLowerCase().contains(value.toLowerCase()),
                              )
                              .toList();
                        });
                      },
                    ),
                    const SizedBox(height: 8),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filtered.length,
                        itemBuilder: (_, i) {
                          final item = filtered[i];
                          return ListTile(
                            title: Text(itemLabel(item)),
                            selected: item == selectedItem,
                            onTap: () {
                              onSelected(item);
                              Navigator.of(ctx).pop();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((_) => searchController.dispose());
  }
}

// --- Multi Select Categories Widget ---
class _MultiSelectCategories extends StatelessWidget {
  const _MultiSelectCategories({
    required this.label,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
  });

  final String label;
  final List<CategoryModel> items;
  final List<CategoryModel> selectedItems;
  final ValueChanged<List<CategoryModel>> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showMultiSelectDialog(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTextStyles.regular11,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          filled: true,
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: selectedItems.isEmpty
            ? const SizedBox.shrink()
            : Wrap(
                spacing: 6,
                runSpacing: 4,
                children: selectedItems.map((cat) {
                  return Chip(
                    label: Text(
                      cat.categoryNameAr,
                      style: AppTextStyles.regular11,
                    ),
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () {
                      final updated = List<CategoryModel>.from(selectedItems)
                        ..remove(cat);
                      onChanged(updated);
                    },
                  );
                }).toList(),
              ),
      ),
    );
  }

  void _showMultiSelectDialog(BuildContext context) {
    final selected = List<CategoryModel>.from(selectedItems);
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return AlertDialog(
              title: Text(label, style: AppTextStyles.bold16),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (_, i) {
                    final cat = items[i];
                    final isChecked = selected.any((s) => s.id == cat.id);
                    return CheckboxListTile(
                      title: Text(cat.categoryNameAr),
                      value: isChecked,
                      activeColor: AppColors.primaryColor,
                      onChanged: (checked) {
                        setDialogState(() {
                          if (checked == true) {
                            selected.add(cat);
                          } else {
                            selected.removeWhere((s) => s.id == cat.id);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child: Text(S.of(context).cancel),
                ),
                TextButton(
                  onPressed: () {
                    onChanged(selected);
                    Navigator.of(ctx).pop();
                  },
                  child: Text(S.of(context).confirm),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
