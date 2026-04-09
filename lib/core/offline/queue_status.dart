enum QueueItemStatus {
  pending,
  uploadingImage,
  uploadingSubmission,
  failed,
  completed;

  String get displayName {
    switch (this) {
      case pending:
        return 'Pending';
      case uploadingImage:
        return 'Uploading image...';
      case uploadingSubmission:
        return 'Submitting...';
      case failed:
        return 'Failed';
      case completed:
        return 'Completed';
    }
  }

  static QueueItemStatus fromString(String value) {
    return QueueItemStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => QueueItemStatus.pending,
    );
  }
}
