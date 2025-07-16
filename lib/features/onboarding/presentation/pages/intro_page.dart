import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    _pageController = PageController(initialPage: widget.initialPage);
    _controller = OnboardingController(widget.initialPage);
  }

  void _goTo(int index) {
    final paths = ['/', '/privacy', '/theme-choice'];
    context.go(paths[index]);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _controller,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (i) {
                    _controller.setPage(i);
                  },
                  children: [_IntroSlide(onNext: () => _goTo(1)), PrivacyPage(onNext: () => _goTo(2)), ThemeChoicePage(onComplete: () => context.go('/home'))],
                ),
              ),
              Consumer<OnboardingController>(
                builder: (context, controller, _) => Padding(padding: const EdgeInsets.symmetric(vertical: 16), child: ProgressDots(count: 3, activeIndex: controller.page)),
              ),
            ],
          ),
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
