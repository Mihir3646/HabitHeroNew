import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habithero1/main.dart';
import 'package:go_router/go_router.dart';

void main() {
  testWidgets('Onboarding navigation', (tester) async {
    await tester.pumpWidget(const MyApp());

    // initially on intro
    expect(find.text('Welcome to Habit Hero!'), findsOneWidget);

    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    expect(find.text('Privacy First'), findsOneWidget);
  });
}
