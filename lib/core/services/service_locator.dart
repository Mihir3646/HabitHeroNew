import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../features/habit/bindings.dart';
import '../../features/habit/data/datasources/hive_data_source.dart';
import '../../features/habit/data/models/completion_model.dart';
import '../../features/habit/data/models/habit_model.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  Hive.registerAdapter(CompletionModelAdapter());

  registerHabitFeature(sl);
  await sl<HiveDataSource>().init();
}
