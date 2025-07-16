import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/habit/presentation/pages/home_page.dart';
import '../features/onboarding/presentation/pages/intro_page.dart';
import '../features/onboarding/presentation/pages/onboarding_pager.dart';
import 'app_routes.dart';

GoRouter createRouter(bool onboardingComplete) {
  return GoRouter(
    initialLocation: onboardingComplete ? AppRoutes.dashboard : AppRoutes.onboarding,
    routes: [
      if (!onboardingComplete)
        GoRoute(
          path: AppRoutes.onboarding,
          builder: (context, state) => OnboardingPager(),
          routes: [
            GoRoute(path: 'privacy', builder: (context, state) => const IntroPage(initialPage: 1)),
            GoRoute(path: 'theme-choice', builder: (context, state) => const IntroPage(initialPage: 2)),
          ],
        ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (context, state) =>
            onboardingComplete ? const HomePage() : const IntroPage(initialPage: 0),
      ),
      GoRoute(path: '/', redirect: (_, __) => AppRoutes.dashboard),
    ],
  );
}
