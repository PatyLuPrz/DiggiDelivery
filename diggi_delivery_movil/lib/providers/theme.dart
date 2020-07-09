import 'package:flutter/material.dart';
import 'package:diggi_delivery_movil/models/theme_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemePreference themePreference = ThemePreference();
  String _theme = ThemePreference.LIGHT;

  String get theme => _theme;

  set setTheme(String theme) {
    _theme = theme;
    themePreference.setModeTheme(theme);
    notifyListeners();
  }

  bool isDarkTheme() => _theme == ThemePreference.DARK;

  currentThemeColorComponents(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.white : Colors.black;
  }

  currentThemeColorText(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.black : Colors.white;
  }
  currentThemeColorContainer(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.black54 : Colors.white54;
  }
}
