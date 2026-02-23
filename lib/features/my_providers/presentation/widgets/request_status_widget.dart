import 'package:flutter/material.dart';

class RequestStatusWidget extends StatelessWidget {
  const RequestStatusWidget({super.key, required this.status});

  final RequestStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          size: 12,
          color: _getStatusColor(status),
        ), // colored status dot
        const SizedBox(width: 6),
        Text(
          status.name(context),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: _getStatusColor(status),
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(RequestStatus status) {
    switch (status) {
      case RequestStatus.accepted:
        return Colors.green;
      case RequestStatus.rejected:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}

enum RequestStatus {
  pending,
  accepted,
  rejected;

  @override
  String toString() {
    switch (this) {
      case RequestStatus.pending:
        return 'pending';
      case RequestStatus.accepted:
        return 'accepted';
      case RequestStatus.rejected:
        return 'rejected';
    }
  }

  String name(BuildContext context) {
    switch (this) {
      case pending:
        return 'قيد المراجعة';
      case accepted:
        return 'مقبول';
      case rejected:
        return 'مرفوض';
    }
  }

  static RequestStatus? fromString(String? status) {
    if (status == null) return null;
    switch (status.toLowerCase()) {
      case 'pending':
        return RequestStatus.pending;
      case 'accepted':
        return RequestStatus.accepted;
      case 'rejected':
        return RequestStatus.rejected;
      default:
        return null;
    }
  }
}
