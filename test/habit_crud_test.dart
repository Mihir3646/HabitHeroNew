import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:habithero1/features/habit/presentation/controller/habit_controller.dart';
import 'package:habithero1/features/habit/domain/habit_repository.dart';
import 'package:habithero1/features/habit/data/models/habit_model.dart';
import 'package:habithero1/features/habit/data/models/completion_model.dart';
import 'package:habithero1/features/habit/presentation/pages/dashboard_page.dart';
import 'package:habithero1/features/habit/presentation/pages/habit_form_page.dart';
import 'package:habithero1/routes/app_routes.dart';

class _FakeRepo implements HabitRepository {
  @override
  Future<int> addCompletion(CompletionModel completion) async => 0;

  @override
  Future<int> addHabit(HabitModel habit) async => 0;

  @override
  Future<void> deleteHabit(int key) async {}

  @override
  List<CompletionModel> getCompletionsForHabit(int habitKey) => [];

  @override
  List<HabitModel> getHabits() => [];
}

void main() {
  testWidgets('habit crud', (tester) async {
    Get.put(HabitController(_FakeRepo()));
    final router = GoRouter(
      initialLocation: AppRoutes.dashboard,
      routes: [
        GoRoute(path: AppRoutes.dashboard, builder: (_, __) => const DashboardPage()),
        GoRoute(path: AppRoutes.habitForm, builder: (_, __) => const HabitFormPage()),
        GoRoute(
          path: '${AppRoutes.habitForm}/:id',
          builder: (_, state) => HabitFormPage(habitId: state.params['id']),
        ),
      ],
    );
    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsNothing);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Read');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsOneWidget);

    await tester.drag(find.byType(ListTile), const Offset(-200, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete').first);
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete').last);
    await tester.pumpAndSettle();
    expect(find.byType(ListTile), findsNothing);
  });
}
