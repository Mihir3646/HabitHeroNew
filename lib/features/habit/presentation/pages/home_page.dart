import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/habit_provider.dart';
import 'add_habit_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HabitProvider(),
      child: Consumer<HabitProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            appBar: AppBar(title: const Text('Habits')),
            body: ListView.builder(
              itemCount: provider.habits.length,
              itemBuilder: (_, i) {
                final habit = provider.habits[i];
                final streak = provider.getStreak(habit.id);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: habit.color,
                    child: Icon(habit.icon, color: Colors.white),
                  ),
                  title: Text(habit.name),
                  subtitle: streak > 0
                      ? Text('Streak: $streak days')
                      : const Text('No progress yet'),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final added = await Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AddHabitPage()));
                if (added == true) {
                  // new habit already added via provider
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
