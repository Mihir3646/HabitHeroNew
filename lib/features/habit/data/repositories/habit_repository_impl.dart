import '../../domain/habit_repository.dart';
import '../datasources/hive_data_source.dart';
import '../models/completion_model.dart';
import '../models/habit_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HiveDataSource dataSource;

  HabitRepositoryImpl(this.dataSource);

  @override
  Future<int> addHabit(HabitModel habit) => dataSource.addHabit(habit);

  @override
  List<HabitModel> getHabits() => dataSource.getHabits();

  @override
  Future<void> deleteHabit(int key) => dataSource.deleteHabit(key);

  @override
  Future<int> addCompletion(CompletionModel completion) =>
      dataSource.addCompletion(completion);

  @override
  List<CompletionModel> getCompletionsForHabit(int habitKey) =>
      dataSource.getCompletionsForHabit(habitKey);
}
