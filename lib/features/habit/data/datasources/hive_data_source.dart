import 'package:hive/hive.dart';

import '../models/habit_model.dart';
import '../models/completion_model.dart';

class HiveDataSource {
  late Box<HabitModel> _habitBox;
  late Box<CompletionModel> _completionBox;

  Future<void> init() async {
    _habitBox = await Hive.openBox<HabitModel>('habits');
    _completionBox = await Hive.openBox<CompletionModel>('completions');
  }

  // Habit CRUD
  Future<int> addHabit(HabitModel habit) => _habitBox.add(habit);

  List<HabitModel> getHabits() => _habitBox.values.toList();

  Future<void> deleteHabit(int key) => _habitBox.delete(key);

  int get habitCount => _habitBox.length;

  // Completion CRUD
  Future<int> addCompletion(CompletionModel completion) =>
      _completionBox.add(completion);

  List<CompletionModel> getCompletionsForHabit(int habitKey) =>
      _completionBox.values
          .where((c) => c.habitKey == habitKey)
          .toList();
}
