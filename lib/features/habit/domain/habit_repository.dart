import '../data/models/habit_model.dart';
import '../data/models/completion_model.dart';

abstract class HabitRepository {
  List<HabitModel> getHabits();
  Future<void> addHabit(HabitModel habit);
  Future<void> updateHabit(HabitModel habit);
  Future<void> deleteHabit(int id);

  Future<void> addCompletion(CompletionModel completion);
  List<CompletionModel> getCompletions();
}
