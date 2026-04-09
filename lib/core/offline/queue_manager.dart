import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../features/add_provider/data/models/agent_provider_model.dart';
import '../../features/add_provider/data/data_sources/provider_remote_data_source.dart';
import '../../features/auth/data/data_sources/auth_local_data_source.dart';
import 'queue_status.dart';
import 'submission_queue.dart';

class QueueManager {
  final SubmissionQueue _queue;
  final ProviderRemoteDataSource _providerRemoteDataSource;
  final AuthLocalDataSource _authLocalDataSource;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;
  bool _isProcessing = false;

  static const int maxRetries = 3;

  QueueManager(
    this._queue,
    this._providerRemoteDataSource,
    this._authLocalDataSource,
  );

  void startListening() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (results) {
        if (!results.contains(ConnectivityResult.none)) {
          processQueue();
        }
      },
    );
  }

  void stopListening() {
    _connectivitySubscription?.cancel();
  }

  Future<void> processQueue() async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      // Check auth first
      final token = await _authLocalDataSource.token;
      if (token == null) return;
      if (await _authLocalDataSource.isTokenExpired) return;

      final items = await _queue.getPendingItems();
      for (final item in items) {
        if (item.retryCount >= maxRetries) continue;

        // Step 1: Upload image if needed
        Map<String, dynamic>? imageJson = item.imageJson;
        if (imageJson == null && item.imageFilePath != null) {
          await _queue.updateStatus(item.id, QueueItemStatus.uploadingImage);
          final file = File(item.imageFilePath!);
          if (!file.existsSync()) {
            await _queue.updateStatus(
              item.id,
              QueueItemStatus.failed,
              errorMessage: 'Image file missing',
              retryCount: maxRetries, // Don't retry
            );
            continue;
          }
          final uploadResult =
              await _providerRemoteDataSource.uploadImage(file);
          final didFail = await uploadResult.fold(
            (error) async {
              await _queue.updateStatus(
                item.id,
                QueueItemStatus.failed,
                errorMessage: error,
                retryCount: item.retryCount + 1,
              );
              return true;
            },
            (json) async {
              imageJson = json;
              await _queue.updateStatus(
                item.id,
                QueueItemStatus.pending,
                imageJson: json,
              );
              return false;
            },
          );
          if (didFail) continue;
        }

        // Step 2: Submit
        await _queue.updateStatus(item.id, QueueItemStatus.uploadingSubmission);
        final payload = Map<String, dynamic>.from(item.payload);
        payload['image'] = imageJson;
        final model = AgentProviderModel.fromJson(payload);

        final submitResult = item.type == 'edit' && item.serviceProviderId != null
            ? await _providerRemoteDataSource.updateProvider(
                item.serviceProviderId!,
                model,
              )
            : await _providerRemoteDataSource.submitProvider(model);

        await submitResult.fold(
          (error) async {
            await _queue.updateStatus(
              item.id,
              QueueItemStatus.failed,
              errorMessage: error,
              retryCount: item.retryCount + 1,
            );
          },
          (_) async {
            await _queue.remove(item.id);
          },
        );
      }
    } finally {
      _isProcessing = false;
    }
  }
}
