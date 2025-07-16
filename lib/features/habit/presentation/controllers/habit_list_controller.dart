import 'package:flutter/material.dart';

import '../../data/models/habit_model.dart';
import '../../domain/habit_repository.dart';

class HabitListController extends ChangeNotifier {
  final HabitRepository repository;
  List<HabitModel> habits = [];

  HabitListController(this.repository) {
    loadHabits();
  }

  void loadHabits() {
    habits = repository.getHabits();
    notifyListeners();
  }

  Future<void> addHabit(String title) async {
    await repository.addHabit(HabitModel(title: title));
    loadHabits();
  }
}
