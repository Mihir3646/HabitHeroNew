import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/habit/presentation/pages/dashboard_page.dart';
import '../features/habit/presentation/pages/habit_form_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import 'app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.dashboard,
  routes: <GoRoute>[
    GoRoute(
      path: AppRoutes.dashboard,
      builder: (BuildContext context, GoRouterState state) =>
          const DashboardPage(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder: (BuildContext context, GoRouterState state) =>
          const SettingsPage(),
    ),
    GoRoute(
      path: AppRoutes.habitForm,
      builder: (BuildContext context, GoRouterState state) =>
          const HabitFormPage(),
    ),
  ],
);
