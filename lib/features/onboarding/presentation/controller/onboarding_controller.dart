import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  OnboardingController([this.initialPage = 0]);

  final int initialPage;
  late final PageController pageController;
  final currentPage = 0.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: initialPage);
    currentPage.value = initialPage;
    super.onInit();
  }

  bool get isLastPage => currentPage.value == 1;

  void setPage(int index) => currentPage.value = index;

  void next(VoidCallback goToDashboard) {
    if (isLastPage) {
      goToDashboard();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
