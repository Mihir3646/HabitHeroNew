import 'datasources/hive_datasource.dart';
import '../domain/habit_repository.dart';
import 'models/habit_model.dart';
import 'models/completion_model.dart';

class HabitRepositoryImpl implements HabitRepository {
  final HiveDataSource dataSource;

  HabitRepositoryImpl(this.dataSource);

  @override
  Future<void> addHabit(HabitModel habit) => dataSource.addHabit(habit);

  @override
  Future<void> updateHabit(HabitModel habit) => dataSource.updateHabit(habit);

  @override
  Future<void> deleteHabit(int id) => dataSource.deleteHabit(id);

  @override
  List<HabitModel> getHabits() => dataSource.getHabits();

  @override
  Future<void> addCompletion(CompletionModel completion) =>
      dataSource.addCompletion(completion);

  @override
  List<CompletionModel> getCompletions() => dataSource.getCompletions();
}
