import 'habit_model.dart';

class HabitRepository {
  final List<Habit> _habits = [];

  List<Habit> getAll() => List.unmodifiable(_habits);

  void add(Habit habit) {
    _habits.add(habit);
  }

  void update(Habit habit) {
    final index = _habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      _habits[index] = habit;
    }
  }

  void delete(int id) {
    _habits.removeWhere((h) => h.id == id);
  }
}
