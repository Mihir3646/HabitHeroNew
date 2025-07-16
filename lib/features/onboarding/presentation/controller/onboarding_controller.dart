import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  /// Controller to drive the [PageView] in the onboarding flow.
  final PageController pageController;

  /// The index of the currently visible onboarding page.
  int _page;

  OnboardingController({int initialPage = 0})
      : _page = initialPage,
        pageController = PageController(initialPage: initialPage);

  int get page => _page;

  bool get isLastPage => _page == 2; // update if page count changes

  /// Update the current page index and notify listeners so that any listening
  /// widgets can rebuild.
  void setPage(int index) {
    _page = index;
    notifyListeners();
  }

  /// Either advance to the next onboarding page or call [goToDashboard] when
  /// the onboarding flow is finished.
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
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
