import '../data/models/completion_model.dart';
import '../data/models/habit_model.dart';

abstract class HabitRepository {
  Future<int> addHabit(HabitModel habit);

  List<HabitModel> getHabits();

  Future<void> deleteHabit(int key);

  Future<int> addCompletion(CompletionModel completion);

  List<CompletionModel> getCompletionsForHabit(int habitKey);
}
