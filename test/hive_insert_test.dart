import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_hero/features/habit/data/models/habit_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HabitModelAdapter());
  });

  test('insert habit', () async {
    final box = await Hive.openBox<HabitModel>('habits_test');
    await box.put(1,
        HabitModel(id: 1, name: 'Test', iconCodePoint: 0xe3af, colorValue: 0));
    expect(box.length, 1);
    await box.deleteFromDisk();
  });
}
