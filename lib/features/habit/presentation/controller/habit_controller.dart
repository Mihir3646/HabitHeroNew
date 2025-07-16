import 'package:get/get.dart';

class HabitEntity {
  String? id;
  String name;
  String? description;
  int iconCode;
  int colorHex;
  HabitEntity({this.id, required this.name, this.description, required this.iconCode, required this.colorHex});
}

class HabitController extends GetxController {
  final habits = <HabitEntity>[].obs;

  void addOrUpdate(HabitEntity h) {
    if (h.id == null) {
      h.id = DateTime.now().microsecondsSinceEpoch.toString();
      habits.add(h);
    } else {
      final i = habits.indexWhere((e) => e.id == h.id);
      if (i != -1) habits[i] = h;
    }
  }

  void delete(String id) {
    habits.removeWhere((e) => e.id == id);
  }
}
