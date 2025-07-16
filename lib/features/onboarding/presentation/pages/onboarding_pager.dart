import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/onboarding_controller.dart';
import 'welcome_page.dart';
import 'whats_new_page.dart';
import '../widgets/progress_dots.dart';
class OnboardingPager extends StatelessWidget {
  OnboardingPager({super.key});
  final c = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: c.pageController,
              onPageChanged: (i) => c.currentPage.value = i,
              children: const [WhatsNewPage(), WelcomePage()],
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Obx(
                () => ProgressDots(count: 2, activeIndex: c.currentPage.value),
              ),
            ),
          ],
        ),
      );
}
