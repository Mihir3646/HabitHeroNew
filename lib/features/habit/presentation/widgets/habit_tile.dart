import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../habit/controllers/habit_controller.dart';
import '../../../habit/data/habit_model.dart';
import '../pages/habit_form_page.dart';
import 'package:get/get.dart';
import '../../../../widgets/heatmap_calendar.dart';

class HabitTile extends StatefulWidget {
  const HabitTile({Key? key, required this.habit, required this.controller}) : super(key: key);

  final Habit habit;
  final HabitController controller;

  @override
  State<HabitTile> createState() => _HabitTileState();
}

class _HabitTileState extends State<HabitTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => Get.to(() => HabitFormPage(controller: widget.controller, habit: widget.habit)),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
          SlidableAction(
            onPressed: (_) => widget.controller.deleteHabit(widget.habit.id),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(widget.habit.icon, color: widget.habit.color),
            title: Text(widget.habit.name),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              onPressed: () => setState(() => _expanded = !_expanded),
            ),
          ),
          if (_expanded)
            GetBuilder<HabitController>(
              id: 'habit_${widget.habit.id}_heatmap',
              builder: (_) => HabitHeatmapCalendar(
                habit: widget.habit,
                completions: widget.habit.completions,
              ),
            ),
        ],
      ),
    );
  }
}
