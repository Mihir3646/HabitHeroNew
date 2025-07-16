import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';

import 'package:habithero1/features/habit/data/datasources/hive_data_source.dart';
import 'package:habithero1/features/habit/data/models/habit_model.dart';
import 'package:habithero1/features/habit/data/models/completion_model.dart';

void main() {
  test('insert habit adds to box', () async {
    final dir = await Directory.systemTemp.createTemp();
    Hive.init(dir.path);
    Hive.registerAdapter(HabitModelAdapter());
    Hive.registerAdapter(CompletionModelAdapter());

    final ds = HiveDataSource();
    await ds.init();
    await ds.addHabit(HabitModel(title: 'Test'));    

    expect(ds.habitCount, 1);
    await dir.delete(recursive: true);
  });
}
