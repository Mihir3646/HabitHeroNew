import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/habit/presentation/pages/home_page.dart';
import '../features/onboarding/presentation/pages/intro_page.dart';
import '../features/onboarding/presentation/pages/onboarding_pager.dart';
import 'app_routes.dart';

// TODO: Persist completion flag in storage
const bool onboardingComplete = false;

GoRouter createRouter() {
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
      // Root route
      GoRoute(path: '/', builder: (context, state) => onboardingComplete ? const HomePage() : const IntroPage(initialPage: 0)),
    ],
  );
}
