int calculateStreak(List<DateTime> dates) {
  if (dates.isEmpty) return 0;
  final uniqueDates = dates
      .map((d) => DateTime(d.year, d.month, d.day))
      .toSet()
      .toList()
    ..sort();
  int streak = 1;
  for (int i = uniqueDates.length - 1; i > 0; i--) {
    final diff = uniqueDates[i].difference(uniqueDates[i - 1]).inDays;
    if (diff == 1) {
      streak++;
    } else if (diff > 1) {
      break;
    }
  }
  return streak;
}
