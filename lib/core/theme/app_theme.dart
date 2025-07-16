import 'package:flutter/material.dart';

import 'colour_schemes.dart';

class AppTheme {
  static ThemeData light() => ThemeData(
        colorScheme: lightScheme,
        useMaterial3: true,
      );

  static ThemeData dark() => ThemeData(
        colorScheme: darkScheme,
        useMaterial3: true,
      );
}
