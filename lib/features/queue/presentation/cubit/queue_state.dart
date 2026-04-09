import 'package:equatable/equatable.dart';

import '../../../../core/offline/submission_queue.dart';

class QueueState extends Equatable {
  final List<QueueItem> items;
  final bool isLoading;

  const QueueState({
    this.items = const [],
    this.isLoading = false,
  });

  QueueState copyWith({
    List<QueueItem>? items,
    bool? isLoading,
  }) {
    return QueueState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [items, isLoading];
}
