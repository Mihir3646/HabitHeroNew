import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/onboarding/presentation/pages/intro_page.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(initialPage: 0),
      routes: [
        GoRoute(
          path: 'privacy',
          builder: (context, state) => const IntroPage(initialPage: 1),
        ),
        GoRoute(
          path: 'theme-choice',
          builder: (context, state) => const IntroPage(initialPage: 2),
        ),
        GoRoute(
          path: 'home',
          builder: (context, state) => const _PlaceholderHome(),
        ),
      ],
    ),
  ],
);

class _PlaceholderHome extends StatelessWidget {
  const _PlaceholderHome();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Home')),
    );
  }
}
