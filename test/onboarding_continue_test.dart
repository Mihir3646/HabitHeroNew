import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:habithero1/core/services/service_locator.dart';
import 'package:habithero1/features/onboarding/presentation/controller/onboarding_controller.dart';
import 'package:habithero1/main.dart';
import 'package:habithero1/routes/app_pages.dart';
import 'package:habithero1/routes/app_routes.dart';
import 'package:habithero1/theme_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => testWidgets('onboarding continue', (tester) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<OnboardingController>(() => OnboardingController());
  Get.put(sl<OnboardingController>());
  final router = createRouter(false);

  await tester.pumpWidget(MyApp(themeNotifier: ThemeNotifier(prefs), router: router));
  await tester.pumpAndSettle();

  await tester.tap(find.text('Continue').first);
  await tester.pumpAndSettle();
  await tester.tap(find.text('Continue').first);
  await tester.pumpAndSettle();

  expect(router.location, AppRoutes.dashboard);
});
