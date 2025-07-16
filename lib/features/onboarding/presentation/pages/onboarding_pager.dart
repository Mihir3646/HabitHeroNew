import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import '../widgets/progress_dots.dart';
import 'welcome_page.dart';
import 'whats_new_page.dart';

class OnboardingPager extends StatefulWidget {
  const OnboardingPager({super.key});

  @override
  State<OnboardingPager> createState() => _OnboardingPagerState();
}

class _OnboardingPagerState extends State<OnboardingPager> {
  late final OnboardingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(OnboardingController());
  }

  @override
  void dispose() {
    Get.delete<OnboardingController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller.pageController,
            onPageChanged: _controller.setPage,
            children: const [WhatsNewPage(), WelcomePage()],
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Obx(
              () => ProgressDots(count: 2, activeIndex: _controller.currentPage.value),
            ),
          ),
        ],
      ),
    );
  }
}
