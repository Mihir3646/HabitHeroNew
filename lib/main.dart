import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

import 'features/onboarding/presentation/controller/onboarding_controller.dart';

import 'core/services/service_locator.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'theme_notifier.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final onboardingComplete = prefs.getBool('onboarding_complete') ?? false;
  final router = createRouter(onboardingComplete);
  final onboardingController = OnboardingController();
  Get.put(onboardingController);
  sl.registerSingleton<OnboardingController>(onboardingController);
  await setupLocator();
  runApp(MyApp(themeNotifier: ThemeNotifier(prefs), router: router));
}

class MyApp extends StatelessWidget {
  final ThemeNotifier themeNotifier;
  final GoRouter router;

  const MyApp({super.key, required this.themeNotifier, required this.router});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeNotifier,
      child: Consumer<ThemeNotifier>(
        builder: (context, notifier, _) {
          return MaterialApp.router(
            title: 'Habit Hero',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: notifier.themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
