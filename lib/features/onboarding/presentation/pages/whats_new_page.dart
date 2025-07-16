import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';
import '../controller/onboarding_controller.dart';

class WhatsNewPage extends StatelessWidget {
  const WhatsNewPage({super.key});

  static const _features = [
    (Icons.calendar_month_outlined, 'Integrated Calendar View', 'See your progress at a glance'),
    (Icons.view_list_rounded, 'Compact List Improvements', 'Cleaner habit summaries'),
    (Icons.bug_report_outlined, 'Bugfixes & Performance', 'Smoother experience'),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Get.find<OnboardingController>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.33, child: const FlutterLogo()),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(20)),
                    child: Text('MAJOR UPDATE', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.onPrimary)),
                  ),
                  const SizedBox(height: 8),
                  Text('New Habit Detail View', style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                  const SizedBox(height: 8),
                  Text('We redesigned the habit detail view for better clarity and overview.', style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  for (final f in _features) _featureRow(context, f.$1, f.$2, f.$3),
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

Widget _featureRow(BuildContext context, IconData icon, String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Icon(icon, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
              Text(subtitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ],
    ),
  );
}
