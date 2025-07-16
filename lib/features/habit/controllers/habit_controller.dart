import 'package:get/get.dart';
import '../data/habit_model.dart';
import '../data/habit_repository.dart';

class HabitController extends GetxController {
  HabitController(this._repository);

  final HabitRepository _repository;

  final RxList<Habit> habits = <Habit>[].obs;

  @override
  void onInit() {
    super.onInit();
    habits.assignAll(_repository.getAll());
  }

  void addHabit(Habit habit) {
    _repository.add(habit);
    habits.add(habit);
  }

  void updateHabit(Habit habit) {
    _repository.update(habit);
    final index = habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      habits[index] = habit;
    }
  }

  void deleteHabit(int id) {
    _repository.delete(id);
    habits.removeWhere((h) => h.id == id);
  }

  Map<DateTime, int> completionsMap(int habitId) {
    final index = habits.indexWhere((h) => h.id == habitId);
    if (index == -1) return {};
    final habit = habits[index];
    final Map<DateTime, int> map = {};
    for (final date in habit.completions) {
      final day = DateTime(date.year, date.month, date.day);
      map.update(day, (v) => v + 1, ifAbsent: () => 1);
    }
    return map;
  }
}
