import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final SharedPreferences prefs;
  ThemeMode _themeMode;

  ThemeNotifier(this.prefs) : _themeMode = _getThemeModeFromPrefs(prefs);

  ThemeMode get themeMode => _themeMode;

  static ThemeMode _getThemeModeFromPrefs(SharedPreferences prefs) {
    final str = prefs.getString('theme_mode');
    switch (str) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return ThemeMode.system;
    }
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    prefs.setString('theme_mode', mode.name);
    notifyListeners();
  }

  void completeOnboarding() {
    prefs.setBool('onboarding_complete', true);
  }
}
