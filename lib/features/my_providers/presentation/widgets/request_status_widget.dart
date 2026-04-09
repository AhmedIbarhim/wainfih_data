import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

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
      case RequestStatus.approved:
        return Colors.green;
      case RequestStatus.declined:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }
}

enum RequestStatus {
  pending,
  approved,
  declined;

  @override
  String toString() {
    switch (this) {
      case RequestStatus.pending:
        return 'pending';
      case RequestStatus.approved:
        return 'approved';
      case RequestStatus.declined:
        return 'declined';
    }
  }

  String name(BuildContext context) {
    final l = S.of(context);
    switch (this) {
      case pending:
        return l.statusPending;
      case approved:
        return l.statusApproved;
      case declined:
        return l.statusDeclined;
    }
  }

  static RequestStatus? fromString(String? status) {
    if (status == null) return null;
    switch (status.toLowerCase()) {
      case 'pending':
        return RequestStatus.pending;
      case 'approved':
        return RequestStatus.approved;
      case 'declined':
        return RequestStatus.declined;
      default:
        return null;
    }
  }
}
