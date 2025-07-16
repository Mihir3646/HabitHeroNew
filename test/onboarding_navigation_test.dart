import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habithero1/main.dart';
import 'package:habithero1/routes/app_pages.dart';
import 'package:habithero1/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Onboarding navigation', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    final router = createRouter(false);
    await tester.pumpWidget(MyApp(themeNotifier: ThemeNotifier(prefs), router: router));

    // initially on intro
    expect(find.text('Welcome to Habit Hero!'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Privacy First'), findsOneWidget);
  });
}
