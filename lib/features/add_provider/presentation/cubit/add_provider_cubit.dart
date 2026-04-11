import 'dart:io';

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
      // Queue for later — image file path is saved, queue manager uploads when online
      await _queue.enqueue(
        type: uiModel.isEditing ? 'edit' : 'create',
        serviceProviderId: uiModel.existingId,
        payload: uiModel.toPayload().toJson(),
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
