import 'package:flutter_test/flutter_test.dart';
import 'package:habithero1/features/onboarding/presentation/pages/privacy_page.dart';
import 'package:habithero1/features/onboarding/presentation/pages/theme_choice_page.dart';
import 'package:habithero1/features/onboarding/presentation/pages/welcome_page.dart';
import 'package:get/get.dart';
import 'package:habithero1/main.dart';
import 'package:habithero1/routes/app_pages.dart';
import 'package:habithero1/routes/app_routes.dart';
import 'package:habithero1/theme_notifier.dart';
import 'package:habithero1/core/services/service_locator.dart';
import 'package:habithero1/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => testWidgets('onboarding flow', (tester) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<OnboardingController>(() => OnboardingController());
  Get.put(sl<OnboardingController>());
  final router = createRouter(false);

  await tester.pumpWidget(MyApp(themeNotifier: ThemeNotifier(prefs), router: router));
  await tester.pumpAndSettle();

  expect(find.byType(WelcomePage), findsOneWidget);
  await tester.tap(find.text('Next'));
  await tester.pumpAndSettle();

  expect(find.byType(PrivacyPage), findsOneWidget);
  await tester.tap(find.text('Next'));
  await tester.pumpAndSettle();

  expect(find.byType(ThemeChoicePage), findsOneWidget);
  await tester.tap(find.text('Light Mode'));
  await tester.pumpAndSettle();

  expect(router.location, AppRoutes.dashboard);
});
