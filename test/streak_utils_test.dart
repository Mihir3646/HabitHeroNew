import 'package:flutter_test/flutter_test.dart';
import 'package:habit_hero/features/habit/utils/streak_utils.dart';

void main() {
  test('streak across leap day', () {
    final dates = [
      DateTime(2024, 2, 27),
      DateTime(2024, 2, 28),
      DateTime(2024, 2, 29),
      DateTime(2024, 3, 1),
    ];
    expect(calculateStreak(dates), 4);
  });
}
