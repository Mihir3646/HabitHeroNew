import 'package:flutter_test/flutter_test.dart';
import 'package:habithero1/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:habithero1/features/onboarding/presentation/pages/whats_new_page.dart';
import 'package:habithero1/main.dart';
import 'package:habithero1/routes/app_pages.dart';
import 'package:habithero1/routes/app_routes.dart';
import 'package:habithero1/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => testWidgets('onboarding flow', (tester) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final router = createRouter(false);

  await tester.pumpWidget(MyApp(themeNotifier: ThemeNotifier(prefs), router: router));
  await tester.pumpAndSettle();
  expect(find.byType(WhatsNewPage), findsOneWidget);
  expect(find.byType(WelcomePage), findsOneWidget);
  await tester.tap(find.text('Continue').first);
  await tester.pumpAndSettle();
  expect(find.byType(WelcomePage), findsOneWidget);
  await tester.tap(find.text('Continue').first);
  await tester.pumpAndSettle();
  expect(router.location, AppRoutes.dashboard);
});
