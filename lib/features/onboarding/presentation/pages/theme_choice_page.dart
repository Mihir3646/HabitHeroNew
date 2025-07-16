import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThemeChoicePage extends StatelessWidget {
  final VoidCallback onStart;
  const ThemeChoicePage({super.key, required this.onStart});

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
              onPressed: onStart,
              child: const Text('Start'),
            ),
          ],
        ),
      ),
    );
  }
}
