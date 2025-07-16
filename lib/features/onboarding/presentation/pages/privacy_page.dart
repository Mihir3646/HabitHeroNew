import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  final VoidCallback onNext;

  const PrivacyPage({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Privacy First', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            const Text('Your data stays on your device. No accounts or tracking.', textAlign: TextAlign.center),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: onNext, child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
