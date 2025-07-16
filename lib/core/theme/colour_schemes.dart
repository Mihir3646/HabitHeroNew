import 'package:flutter/material.dart';

const seedPrimary = Color(0xFFFDBE31); // Yellow 600
const accentGrey  = Color(0xFFF0F0F0); // Grey 400

final lightScheme = ColorScheme.fromSeed(
  seedColor: seedPrimary,
  secondary: accentGrey,
  brightness: Brightness.light,
);

final darkScheme = ColorScheme.fromSeed(
  seedColor: seedPrimary,
  secondary: accentGrey,
  brightness: Brightness.dark,
);
