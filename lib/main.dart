import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes/app_pages.dart';
import 'features/onboarding/bindings.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
  runApp(const HabitHeroApp());
}

class HabitHeroApp extends StatelessWidget {
  const HabitHeroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Habit Hero',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF43A047)),
      ),
      initialBinding: OnboardingBinding(),
      routerConfig: router,
    );
  }
}
