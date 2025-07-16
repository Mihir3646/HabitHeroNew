import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/presentation/pages/intro_page.dart';
import '../features/habit/presentation/pages/home_page.dart';

GoRouter createRouter(bool onboardingComplete) {
  return GoRouter(
    initialLocation: onboardingComplete ? '/home' : '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            onboardingComplete ? const HomePage() : const IntroPage(initialPage: 0),
        routes: [
          if (!onboardingComplete) ...[
            GoRoute(
              path: 'privacy',
              builder: (context, state) => const IntroPage(initialPage: 1),
            ),
            GoRoute(
              path: 'theme-choice',
              builder: (context, state) => const IntroPage(initialPage: 2),
            ),
          ],
          GoRoute(
            path: 'home',
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
    ],
  );
}

