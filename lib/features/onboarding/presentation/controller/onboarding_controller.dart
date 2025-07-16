import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageIndex = 0.obs;

  void next() {
    if (pageIndex.value < 2) {
      pageIndex.value++;
    } else {
      Get.offAllNamed(AppRoutes.dashboard);
    }
  }
}
