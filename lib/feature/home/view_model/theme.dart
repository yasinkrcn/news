import 'package:flutter/material.dart';
import 'package:news/core/constants/app_colors.dart';

enum MyTheme { light, dark }

class ThemeNotifier extends ChangeNotifier {
  bool isDarkTheme = false;
  static List<ThemeData> themes = [
    ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.red,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        )),
    ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(color: Colors.black),
    ),
  ];

  MyTheme currentColor = MyTheme.dark;
  ThemeData _currentTheme = themes[1];

  set currentTheme(theme) {
    if (theme != null) {
      currentColor = theme;
      _currentTheme = currentColor == MyTheme.dark ? themes[1] : themes[0];
      isDarkTheme = !isDarkTheme;

      notifyListeners();
    }
  }

  get myTheme => currentColor;

  get currentTheme => _currentTheme;

  void switchTheme() => currentColor == MyTheme.light
      ? currentTheme = MyTheme.dark
      : currentTheme = MyTheme.light;
}
