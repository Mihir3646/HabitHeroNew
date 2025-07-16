import 'package:flutter/material.dart';
import 'features/habit/presentation/pages/dashboard_page.dart';

void main() {
  runApp(const HabitHeroApp());
}

class HabitHeroApp extends StatelessWidget {
  const HabitHeroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Hero',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const DashboardPage(),
    );
  }
}
