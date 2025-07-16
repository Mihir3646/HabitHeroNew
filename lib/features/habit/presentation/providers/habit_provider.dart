import 'package:flutter/material.dart';

/// Basic habit entity used by [HabitProvider].
class HabitData {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  int streak;

  HabitData({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.streak = 0,
  });
}

/// Represents a completion entry for a habit on a specific date.
class HabitEntry {
  final String habitId;
  final DateTime date;
  final int level; // 0 = not done, 1-4 = done with intensity

  HabitEntry({
    required this.habitId,
    required this.date,
    this.level = 1,
  });
}

/// Simple provider that keeps habits and their completion entries in memory.
class HabitProvider extends ChangeNotifier {
  final List<HabitData> _habits = [];
  final List<HabitEntry> _entries = [];

  List<HabitData> get habits => _habits;
  List<HabitEntry> get entries => _entries;

  void addHabit(HabitData habit) {
    _habits.add(habit);
    notifyListeners();
  }

  void addEntry(HabitEntry entry) {
    _entries.add(entry);
    notifyListeners();
  }

  /// Returns the current streak (in days) for the given habit.
  int getStreak(String habitId) {
    final completedDays = _entries
        .where((e) => e.habitId == habitId && e.level > 0)
        .map((e) => DateTime(e.date.year, e.date.month, e.date.day))
        .toSet()
        .toList()
      ..sort((a, b) => b.compareTo(a));

    var streak = 0;
    var day = DateTime.now();
    while (completedDays.contains(day)) {
      streak++;
      day = day.subtract(const Duration(days: 1));
    }
    return streak;
  }

  /// Placeholder for generating heatmap data from [_entries].
  Map<String, List<List<int>>> generateHeatmap() {
    // Implement custom logic if needed. Returned map should contain
    // months mapped to a 2D grid of completion levels.
    return {};
  }
}
