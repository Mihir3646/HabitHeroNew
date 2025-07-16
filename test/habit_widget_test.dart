import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:habit_hero/features/habit/presentation/pages/dashboard_page.dart';

void main() {
  testWidgets('create habit increments tile count', (tester) async {
    await tester.pumpWidget(
      const GetMaterialApp(home: DashboardPage()),
    );

    expect(find.byType(ListTile), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Read');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsOneWidget);
  });
}
