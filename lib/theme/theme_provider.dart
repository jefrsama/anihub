import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.dark,
);

final ThemeData customTheme = ThemeData(
  primarySwatch: Colors.orange,
  brightness: Brightness.light,
  appBarTheme: AppBarTheme(
    color: Colors.orange,
  ),
);

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  void setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightTheme) {
      _themeData = darkTheme;
    } else if (_themeData == darkTheme) {
      _themeData = customTheme;
    } else {
      _themeData = lightTheme;
    }
    notifyListeners();
  }
}
