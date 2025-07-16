import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../features/habit/data/habit_model.dart';

class HabitHeatmapCalendar extends StatelessWidget {
  final Habit habit;
  final List<DateTime> completions;

  const HabitHeatmapCalendar({Key? key, required this.habit, required this.completions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<DateTime, int> data = {};
    for (final d in completions) {
      final day = DateTime(d.year, d.month, d.day);
      data.update(day, (v) => v + 1, ifAbsent: () => 1);
    }
    return HeatMapCalendar(
      flexible: true,
      colorMode: ColorMode.color,
      datasets: data,
      colorsets: const {
        1: Colors.green,
        3: Colors.lightGreen,
        5: Colors.teal,
        7: Colors.blue,
        10: Colors.indigo,
      },
    );
  }
}
