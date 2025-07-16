import 'package:flutter/material.dart';

class Habit {
  final int id;
  String name;
  IconData icon;
  Color color;
  List<DateTime> completions;

  Habit({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    this.completions = const [],
  });
}
