import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../controller/onboarding_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static const _features = [
    (Icons.check_circle_outline, 'Track daily habits', 'Build consistency'),
    (Icons.done_all, 'Streak rewards', 'Achieve milestones'),
    (Icons.grid_view, 'Organize categories', 'Easy overview'),
    (Icons.local_fire_department, 'Stay motivated', 'Keep the fire burning'),
    (Icons.notifications, 'Timely reminders', 'Never miss a task'),
    (Icons.palette, 'Theme options', 'Customize look'),
    (Icons.history_toggle_off, 'Detailed stats', 'See history'),
    (Icons.share, 'Share progress', 'With friends'),
    (Icons.home_work_outlined, 'Backup data', 'Across devices'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<OnboardingController>();
    final primary = Theme.of(context).colorScheme.primary;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Welcome to Habit',
                      style: Theme.of(context).textTheme.headlineSmall,
                      children: [TextSpan(text: 'Hero', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: primary, fontWeight: FontWeight.bold))],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(child: ListView.builder(itemCount: _features.length, itemBuilder: (context, i) => _featureRow(context, primary, _features[i]))),
                ],
              ),
            ),
            SizedBox(width: double.infinity, height: 56, child: ElevatedButton(onPressed: () => c.next(() => Get.offAllNamed(AppRoutes.dashboard)), child: const Text('Continue'))),
          ],
        ),
      ),
    );
  }
}

Widget _featureRow(BuildContext context, Color color, (IconData, String, String) data) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
          child: Icon(data.$1, color: Theme.of(context).colorScheme.onPrimary),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.$2, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color, fontWeight: FontWeight.bold)),
              Text(data.$3, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    ),
  );
}
