import 'package:expenses_tracker/theme/dark_them.dart';
import 'package:expenses_tracker/theme/light_theme.dart';
import 'package:flutter/material.dart';

class AppThemeProvider with ChangeNotifier {
  bool _isDark = true;

  void tooglingTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  ThemeData get gettingTheAppTheme {
    return _isDark ? buildAppDarkTheme() : buildAppLightTheme();
  }

  bool get isItDarkOrLight {
    return _isDark;
  }
}
