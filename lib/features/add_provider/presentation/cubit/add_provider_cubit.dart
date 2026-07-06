import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/upsert_provider_ui_model.dart';
import '../../data/repos/provider_submission_repository.dart';
import '../../../../core/offline/submission_queue.dart';
import 'add_provider_state.dart';

class AddProviderCubit extends Cubit<AddProviderState> {
  final ProviderSubmissionRepository _repository;
  final SubmissionQueue _queue;

  AddProviderCubit(this._repository, this._queue) : super(AddProviderInitial());

  Future<void> submit(UpsertProviderUiModel uiModel) async {
    // Check connectivity first
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = !connectivityResult.contains(ConnectivityResult.none);

    if (!isOnline) {
      // Queue for later — image file path is saved, queue manager uploads when online.
      // Build the payload map manually to avoid toPayload() force-unwrapping
      // imageJson.value!, which is null when no image has been uploaded yet.
      // The queue manager will inject the image fields after uploading the file.
      await _queue.enqueue(
        type: uiModel.isEditing ? 'edit' : 'create',
        serviceProviderId: uiModel.existingId,
        payload: {
          if (uiModel.nameAr.text.isNotEmpty) 'serviceProviderNameAr': uiModel.nameAr.text,
          if (uiModel.nameEn.text.isNotEmpty) 'serviceProviderNameEn': uiModel.nameEn.text,
          'mobileNumber1': uiModel.mobile1.text,
          if (uiModel.mobile2.text.isNotEmpty) 'mobileNumber2': uiModel.mobile2.text,
          if (uiModel.contactPerson.text.isNotEmpty) 'contactPersonName': uiModel.contactPerson.text,
          if (uiModel.notes.text.isNotEmpty) 'notes': uiModel.notes.text,
          'lat': uiModel.location.value!.latitude,
          'lng': uiModel.location.value!.longitude,
          if (uiModel.selectedDistrict.value != null)
            'districtId': uiModel.selectedDistrict.value!.id,
          if (uiModel.selectedCategory.value != null)
            'categoryIds': [uiModel.selectedCategory.value!.id],
        },
        imageFilePath: uiModel.imageFile.value?.path,
        imageJson: uiModel.imageJson.value,
      );
      emit(AddProviderQueuedOffline());
      return;
    }

    // Online — upload image if needed
    if (uiModel.imageFile.value != null && uiModel.imageJson.value == null) {
      emit(AddProviderImageUploading());
      final uploadResult = await _repository.uploadImage(uiModel.imageFile.value!);
      final failed = uploadResult.fold(
        (error) {
          emit(AddProviderSubmitFailed(error));
          return true;
        },
        (imageJson) {
          uiModel.imageJson.value = imageJson;
          return false;
        },
      );
      if (failed) return;
    }

    // Submit
    emit(AddProviderSubmitting());
    final payload = uiModel.toPayload();

    if (uiModel.isEditing) {
      final result = await _repository.updateProvider(
        uiModel.existingId!,
        payload,
      );
      result.fold(
        (error) => emit(AddProviderSubmitFailed(error)),
        (id) => emit(AddProviderSubmitSuccess(id)),
      );
    } else {
      final result = await _repository.submitProvider(payload);
      result.fold(
        (error) => emit(AddProviderSubmitFailed(error)),
        (id) => emit(AddProviderSubmitSuccess(id)),
      );
    }
  }
}
