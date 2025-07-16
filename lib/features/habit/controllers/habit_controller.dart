import 'package:get/get.dart';
import '../data/models/habit_model.dart';
import '../domain/habit_repository.dart';

class HabitController extends GetxController {
  HabitController(this._repository);

  final HabitRepository _repository;

  final RxList<HabitModel> habits = <HabitModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    habits.assignAll(_repository.getHabits());
  }

  void addHabit(HabitModel habit) {
    _repository.addHabit(habit);
    habits.add(habit);
  }

  void updateHabit(HabitModel habit) {
    _repository.updateHabit(habit);
    final index = habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      habits[index] = habit;
    }
  }

  void deleteHabit(int id) {
    _repository.deleteHabit(id);
    habits.removeWhere((h) => h.id == id);
  }

  Map<DateTime, int> completionsMap(int habitId) {
    final completions =
        _repository.getCompletions().where((c) => c.habitId == habitId);
    final Map<DateTime, int> map = {};
    for (final c in completions) {
      final day = DateTime(c.date.year, c.date.month, c.date.day);
      map.update(day, (v) => v + 1, ifAbsent: () => 1);
    }
    return map;
  }
}
