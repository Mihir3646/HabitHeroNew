import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../controller/habit_controller.dart';

class HabitTile extends StatelessWidget {
  final HabitEntity habit;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const HabitTile({super.key, required this.habit, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(habit.id),
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onEdit(),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (_) => onDelete(),
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          color: Color(habit.colorHex),
          child: Icon(IconData(habit.iconCode, fontFamily: 'MaterialIcons'), color: Colors.white),
        ),
        title: Text(habit.name),
        subtitle: (habit.description ?? '').isEmpty ? null : Text(habit.description!),
      ),
    );
  }
}
