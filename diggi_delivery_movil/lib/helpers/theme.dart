import 'package:flutter/material.dart';
import 'package:diggi_delivery_movil/utils/theme_preferences.dart';

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

  //Cambia el color de algunos componentes
  currentThemeColorComponents(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.white : Colors.black;
  }

  //Cambia el color del texto
  currentThemeColorText(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.black : Colors.white;
  }

  //Cambia el color de los container
  currentThemeColorContainer(ThemeProvider currentTheme) {
    return currentTheme.isDarkTheme() ? Colors.black54 : Colors.white54;
  }
}
