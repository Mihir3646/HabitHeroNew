import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/progress_dots.dart';
import 'privacy_page.dart';
import 'theme_choice_page.dart';

class IntroPage extends StatefulWidget {
  final int initialPage;

  const IntroPage({super.key, this.initialPage = 0});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late final PageController _pageController;
  late OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardingController(widget.initialPage);
    _pageController = _controller.pageController;
  }

  void _goTo(int index) {
    final paths = ['/', '/privacy', '/theme-choice'];
    context.go(paths[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _controller.setPage,
                children: [
                  _IntroSlide(onNext: () => _goTo(1)),
                  PrivacyPage(onNext: () => _goTo(2)),
                  ThemeChoicePage(onComplete: () => context.go('/home')),
                ],
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ProgressDots(
                  count: 3,
                  activeIndex: _controller.currentPage.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroSlide extends StatelessWidget {
  final VoidCallback onNext;

  const _IntroSlide({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to Habit Hero!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            const Text('Track your habits and build better routines.', textAlign: TextAlign.center),
            const SizedBox(height: 32),
            ElevatedButton(onPressed: onNext, child: const Text('Next')),
          ],
        ),
      ),
    );
  }
}
