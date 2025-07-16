import 'package:hive/hive.dart';

import '../models/habit_model.dart';
import '../models/completion_model.dart';

class HiveDataSource {
  static const String habitBoxName = 'habits';
  static const String completionBoxName = 'completions';

  late Box<HabitModel> _habitBox;
  late Box<CompletionModel> _completionBox;

  Future<void> init() async {
    _habitBox = await Hive.openBox<HabitModel>(habitBoxName);
    _completionBox = await Hive.openBox<CompletionModel>(completionBoxName);
  }

  List<HabitModel> getHabits() => _habitBox.values.toList();

  Future<void> addHabit(HabitModel habit) => _habitBox.put(habit.id, habit);
  Future<void> updateHabit(HabitModel habit) => _habitBox.put(habit.id, habit);
  Future<void> deleteHabit(int id) => _habitBox.delete(id);

  Future<void> addCompletion(CompletionModel c) => _completionBox.add(c);
  List<CompletionModel> getCompletions() => _completionBox.values.toList();
}
