import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/habit/data/models/habit_model.dart';
import 'features/habit/data/models/completion_model.dart';
import 'features/habit/data/datasources/hive_datasource.dart';
import 'features/habit/data/habit_repository_impl.dart';
import 'features/habit/domain/habit_repository.dart';

final sl = GetIt.instance;

Future<void> initServiceLocator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(CompletionModelAdapter());

  final dataSource = HiveDataSource();
  await dataSource.init();
  sl.registerLazySingleton<HiveDataSource>(() => dataSource);
  sl.registerLazySingleton<HabitRepository>(() => HabitRepositoryImpl(sl()));
}
