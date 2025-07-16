import 'package:get/get.dart';
import 'controllers/habit_controller.dart';
import 'package:habit_hero/service_locator.dart' as di;
import 'domain/habit_repository.dart';

class HabitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HabitController(di.sl<HabitRepository>()));
  }
}
