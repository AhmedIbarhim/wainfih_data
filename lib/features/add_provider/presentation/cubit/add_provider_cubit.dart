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

  Future<void> uploadImage(File file) async {
    emit(AddProviderImageUploading());
    final result = await _repository.uploadImage(file);
    result.fold(
      (error) => emit(AddProviderImageFailed(error)),
      (imageJson) => emit(AddProviderImageUploaded(imageJson)),
    );
  }

  Future<void> submit(UpsertProviderUiModel uiModel) async {
    // Check connectivity
    final connectivityResult = await Connectivity().checkConnectivity();
    final isOnline = !connectivityResult.contains(ConnectivityResult.none);

    if (!isOnline) {
      // Queue for later
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
