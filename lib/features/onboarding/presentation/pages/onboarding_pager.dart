import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnboardingPager extends StatelessWidget {
  const OnboardingPager({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => PageView(
            controller: PageController(initialPage: controller.pageIndex.value),
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildPage('Welcome to Habit Hero', 'assets/mock_phones.png'),
              _buildPage('Track habits easily', 'assets/mock_phones.png'),
              _buildPage('Stay motivated', 'assets/mock_phones.png', showButton: true, onPressed: controller.next),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(String text, String asset, {bool showButton = false, VoidCallback? onPressed}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(asset, height: 200),
        const SizedBox(height: 24),
        Text(text, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24)),
        if (showButton)
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: ElevatedButton(
              onPressed: onPressed,
              child: const Text('Get Started'),
            ),
          ),
      ],
    );
  }
}
