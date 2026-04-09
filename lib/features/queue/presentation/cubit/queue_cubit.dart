import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/offline/queue_manager.dart';
import '../../../../core/offline/queue_status.dart';
import '../../../../core/offline/submission_queue.dart';
import 'queue_state.dart';

class QueueCubit extends Cubit<QueueState> {
  final SubmissionQueue _queue;
  final QueueManager _queueManager;

  QueueCubit(this._queue, this._queueManager) : super(const QueueState());

  Future<void> refresh() async {
    emit(state.copyWith(isLoading: true));
    final items = await _queue.getAllItems();
    emit(state.copyWith(items: items, isLoading: false));
  }

  Future<void> retryItem(String itemId) async {
    // Reset status to pending and retryCount so it gets picked up
    await _queue.updateStatus(itemId, QueueItemStatus.pending, retryCount: 0);
    await refresh();
    // Trigger queue processing
    _queueManager.processQueue();
  }

  Future<void> removeItem(String itemId) async {
    await _queue.remove(itemId);
    await refresh();
  }
}
