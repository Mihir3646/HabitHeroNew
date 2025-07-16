import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:habit_hero/main.dart';
import 'package:habit_hero/routes/app_routes.dart';

void main() {
  testWidgets('dashboard navigation', (tester) async {
    await tester.pumpWidget(const HabitHeroApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    BuildContext context = tester.element(find.byType(Navigator));
    expect(GoRouter.of(context).location, AppRoutes.habitForm);

    GoRouter.of(context).go(AppRoutes.dashboard);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();

    context = tester.element(find.byType(Navigator));
    expect(GoRouter.of(context).location, AppRoutes.settings);
  });
}
