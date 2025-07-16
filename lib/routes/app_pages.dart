import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/habit/presentation/pages/dashboard_page.dart';
import '../features/habit/presentation/pages/habit_form_page.dart';
import '../features/onboarding/presentation/pages/intro_page.dart';
import '../features/onboarding/presentation/pages/onboarding_pager.dart';
import 'app_routes.dart';

GoRouter createRouter(bool onboardingComplete) {
  return GoRouter(
    initialLocation: AppRoutes.onboarding,
    routes: [
      // Onboarding route
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (context, state) => OnboardingPager(),
        routes: [
          if (!onboardingComplete) ...[
            GoRoute(path: 'privacy', builder: (context, state) => const IntroPage(initialPage: 1)),
            GoRoute(path: 'theme-choice', builder: (context, state) => const IntroPage(initialPage: 2)),
          ],
        ],
      ),
      // Dashboard
      GoRoute(path: AppRoutes.dashboard, builder: (context, state) => const DashboardPage()),
      // Root route
      GoRoute(path: '/', builder: (context, state) => onboardingComplete ? const DashboardPage() : const IntroPage(initialPage: 0)),
      // Habit form
      GoRoute(
        path: '${AppRoutes.habitForm}/:id?',
        builder: (_, state) {
          final id = state.pathParameters['id'];
          return HabitFormPage(habitId: id);
        },
      ),
    ],
  );
}
