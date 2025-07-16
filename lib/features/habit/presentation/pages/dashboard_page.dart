import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_routes.dart';
import '../controller/habit_controller.dart';
import '../widgets/habit_tile.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HabitController>();
    return Obx(() {
      final items = c.habits;
      return Scaffold(
        appBar: AppBar(title: const Text('Habits')),
        body: items.isEmpty
            ? const Center(child: Text('No habits yet'))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) => HabitTile(
                  habit: items[i],
                  onEdit: () => context.push('${AppRoutes.habitForm}/${items[i].id}'),
                  onDelete: () => _confirmDelete(context, c, items[i].id!),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push(AppRoutes.habitForm),
          child: const Icon(Icons.add),
        ),
      );
    });
  }

  Future<void> _confirmDelete(BuildContext context, HabitController c, String id) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete habit?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(ctx, true), child: const Text('Delete')),
        ],
      ),
    );
    if (ok == true) c.delete(id);
  }
}
