import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/habit_repository.dart';
import '../../controllers/habit_controller.dart';
import '../widgets/habit_tile.dart';
import 'habit_form_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HabitController(HabitRepository()));
    return Scaffold(
      appBar: AppBar(title: const Text('Habits')),
      body: Obx(() {
        final habits = controller.habits;
        return ListView.builder(
          itemCount: habits.length,
          itemBuilder: (context, index) {
            return HabitTile(habit: habits[index], controller: controller);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => HabitFormPage(controller: controller)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
