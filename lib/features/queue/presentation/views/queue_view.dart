import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/offline/queue_status.dart';
import '../../../../core/offline/submission_queue.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/l10n.dart';
import '../cubit/queue_cubit.dart';
import '../cubit/queue_state.dart';

class QueueView extends StatelessWidget {
  const QueueView({super.key});

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return Scaffold(
      appBar: buildCustomAppBar(context, title: l.queueTitle),
      body: BlocBuilder<QueueCubit, QueueState>(
        builder: (context, state) {
          if (state.isLoading && state.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.items.isEmpty) {
            return Center(
              child: Text(
                l.queueEmpty,
                style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => context.read<QueueCubit>().refresh(),
            child: ListView.separated(
              itemCount: state.items.length,
              padding: const EdgeInsets.all(16),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (_, index) {
                final item = state.items[index];
                return _QueueItemCard(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class _QueueItemCard extends StatelessWidget {
  const _QueueItemCard({required this.item});

  final QueueItem item;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item.providerName,
                    style: AppTextStyles.bold16,
                  ),
                ),
                _StatusBadge(status: item.status),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  item.type == 'edit' ? Icons.edit_outlined : Icons.add_circle_outline,
                  size: 16,
                  color: Colors.grey,
                ),
                const SizedBox(width: 4),
                Text(
                  item.type == 'edit' ? l.editButton : l.addProviderAction,
                  style: AppTextStyles.regular11.copyWith(color: Colors.grey),
                ),
                const Spacer(),
                Text(
                  '${item.createdAt.year}-'
                  '${item.createdAt.month.toString().padLeft(2, '0')}-'
                  '${item.createdAt.day.toString().padLeft(2, '0')} '
                  '${item.createdAt.hour.toString().padLeft(2, '0')}:'
                  '${item.createdAt.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            if (item.errorMessage != null && item.errorMessage!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                item.errorMessage!,
                style: AppTextStyles.regular11.copyWith(
                  color: AppColors.errorColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            if (item.status == QueueItemStatus.failed) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                    onPressed: () =>
                        context.read<QueueCubit>().retryItem(item.id),
                    icon: const Icon(Icons.refresh, size: 18),
                    label: Text(l.retryButton),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  TextButton.icon(
                    onPressed: () =>
                        context.read<QueueCubit>().removeItem(item.id),
                    icon: const Icon(Icons.delete_outline, size: 18),
                    label: Text(l.delete),
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.errorColor,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final QueueItemStatus status;

  @override
  Widget build(BuildContext context) {
    final l = S.of(context);
    Color color;
    String text;

    switch (status) {
      case QueueItemStatus.pending:
        color = Colors.orange;
        text = l.queueStatusPending;
      case QueueItemStatus.uploadingImage:
        color = Colors.blue;
        text = l.queueUploadingImage;
      case QueueItemStatus.uploadingSubmission:
        color = Colors.blue;
        text = l.queueSubmitting;
      case QueueItemStatus.failed:
        color = AppColors.errorColor;
        text = l.queueFailed;
      case QueueItemStatus.completed:
        color = AppColors.successColor;
        text = l.queueCompleted;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
