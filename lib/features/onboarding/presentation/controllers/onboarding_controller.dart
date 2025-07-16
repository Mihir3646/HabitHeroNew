import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  int page;
  OnboardingController(this.page);

  void setPage(int newPage) {
    page = newPage;
    notifyListeners();
  }
}
