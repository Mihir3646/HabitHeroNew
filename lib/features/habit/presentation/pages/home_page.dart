import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/service_locator.dart';
import '../../domain/habit_repository.dart';
import '../controllers/habit_list_controller.dart';
import 'add_habit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitListController(sl<HabitRepository>()),
      child: Consumer<HabitListController>(
        builder: (context, controller, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Habits')),
            body: ListView.builder(
              itemCount: controller.habits.length,
              itemBuilder: (_, i) {
                final habit = controller.habits[i];
                return ListTile(title: Text(habit.title));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final added = await Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const AddHabitPage()),
                );
                if (added == true) {
                  controller.loadHabits();
                }
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
