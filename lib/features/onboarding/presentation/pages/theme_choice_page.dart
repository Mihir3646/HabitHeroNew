import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../theme_notifier.dart';
class ThemeChoicePage extends StatelessWidget {
  final VoidCallback onComplete;
  const ThemeChoicePage({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Choose Your Theme',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'Pick light or dark mode to get started.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeNotifier>().setThemeMode(ThemeMode.light);
                context.read<ThemeNotifier>().completeOnboarding();
                onComplete();
              },
              child: const Text('Light Mode'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeNotifier>().setThemeMode(ThemeMode.dark);
                context.read<ThemeNotifier>().completeOnboarding();
                onComplete();
              },
              child: const Text('Dark Mode'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.read<ThemeNotifier>().setThemeMode(ThemeMode.system);
                context.read<ThemeNotifier>().completeOnboarding();
                onComplete();
              },
              child: const Text('System Default'),
            ),
          ],
        ),
      ),
    );
  }
}
