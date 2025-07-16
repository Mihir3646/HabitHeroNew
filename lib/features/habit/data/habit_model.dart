import 'package:flutter/material.dart';

class Habit {
  final int id;
  String name;
  IconData icon;
  Color color;

  Habit({required this.id, required this.name, required this.icon, required this.color});
}
