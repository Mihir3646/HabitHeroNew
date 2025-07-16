import 'package:get_it/get_it.dart';

import 'package:get/get.dart';

import 'data/datasources/hive_data_source.dart';
import 'data/repositories/habit_repository_impl.dart';
import 'domain/habit_repository.dart';
import 'presentation/controller/habit_controller.dart';

void registerHabitFeature(GetIt sl) {
  final dataSource = HiveDataSource();
  sl.registerSingleton<HiveDataSource>(dataSource);
  sl.registerLazySingleton<HabitRepository>(
      () => HabitRepositoryImpl(sl<HiveDataSource>()));
  Get.lazyPut(() => HabitController(sl<HabitRepository>()));
}
