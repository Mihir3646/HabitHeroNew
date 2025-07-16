import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../../../../routes/app_routes.dart';
import '../controller/habit_controller.dart';
import '../widgets/habit_tile.dart';
import '../../../../widgets/custom_bottom_tab_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  void _onTabTap(int index) {
    if (index == 2) {
      context.push(AppRoutes.habitForm);
      return;
    }
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.find<HabitController>();
    return Obx(() {
      final items = c.habits;
      Widget body;
      switch (_currentIndex) {
        case 0:
          body = items.isEmpty
              ? const Center(child: Text('No habits yet'))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (_, i) => HabitTile(
                    habit: items[i],
                    onEdit: () =>
                        context.push('${AppRoutes.habitForm}/${items[i].id}'),
                    onDelete: () => _confirmDelete(context, c, items[i].id!),
                  ),
                );
          break;
        case 1:
          body = const Center(child: Text('Calendar'));
          break;
        case 3:
          body = const Center(child: Text('Friends'));
          break;
        case 4:
          body = const Center(child: Text('Settings'));
          break;
        default:
          body = const SizedBox.shrink();
      }

      return Scaffold(
        appBar: AppBar(title: const Text('Habits')),
        body: body,
        floatingActionButton: _currentIndex == 0
            ? FloatingActionButton(
                onPressed: () => context.push(AppRoutes.habitForm),
                child: const Icon(Icons.add),
              )
            : null,
        bottomNavigationBar:
            CustomBottomTabBar(currentIndex: _currentIndex, onTap: _onTabTap),
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
