import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  bool get isLastPage => currentPage.value == 1;

  void next(VoidCallback goToDashboard) => isLastPage ? goToDashboard() : pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
}
