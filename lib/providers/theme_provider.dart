import 'package:flutter/material.dart';
import 'package:news/core/prefshelper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;

  initTheme() {
    bool isDark = PrefHelper.getTheme();
    if (isDark == true) {
      currentTheme = ThemeMode.dark;
    } else {
      currentTheme = ThemeMode.light;
    }
  }

  changeTheme(ThemeMode newTheme) {
    currentTheme = newTheme;
    if (currentTheme == ThemeMode.dark) {
      PrefHelper.setTheme(true);
    } else {
      PrefHelper.setTheme(false);
    }
    notifyListeners();
  }
}
