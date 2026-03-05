class DateFilterUtils {
  /// Checks if the given [date] is today.
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Checks if the given [date] is within the current week starting from Saturday and ending on Friday.
  static bool isThisWeek(DateTime date) {
    final now = DateTime.now();
    // Calculate the start of the week (the most recent Saturday)
    // weekday is 1 for Monday, ..., 6 for Saturday, 7 for Sunday
    final startOfWeek = now.subtract(Duration(days: (now.weekday % 7 + 1) % 7));
    // Normalize to start of day
    final normalizedStart = DateTime(
      startOfWeek.year,
      startOfWeek.month,
      startOfWeek.day,
    );

    final startOfNextWeek = normalizedStart.add(const Duration(days: 7));

    return date.isAfter(normalizedStart.subtract(const Duration(seconds: 1))) &&
        date.isBefore(startOfNextWeek);
  }

  /// Checks if the given [date] is within the current Gregorian month.
  static bool isThisMonth(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month;
  }
}
