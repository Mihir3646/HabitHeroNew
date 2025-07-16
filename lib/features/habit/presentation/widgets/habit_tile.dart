import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../habit/controllers/habit_controller.dart';
import '../../../habit/data/habit_model.dart';
import '../pages/habit_form_page.dart';
import 'package:get/get.dart';

class HabitTile extends StatelessWidget {
  const HabitTile({Key? key, required this.habit, required this.controller}) : super(key: key);

  final Habit habit;
  final HabitController controller;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => Get.to(() => HabitFormPage(controller: controller, habit: habit)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (_) => controller.deleteHabit(habit.id),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(habit.icon, color: habit.color),
        title: Text(habit.name),
      ),
    );
  }
}
