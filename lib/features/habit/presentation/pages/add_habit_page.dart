import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Habit')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: const InputDecoration(labelText: 'Habit name')),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final title = _controller.text.trim();
                if (title.isNotEmpty) {
                  context.read<HabitProvider>().addHabit(
                        HabitData(
                          id: DateTime.now().microsecondsSinceEpoch.toString(),
                          name: title,
                          icon: Icons.check,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                  Navigator.of(context).pop(true);
                }
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
