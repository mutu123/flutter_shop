import 'package:flutter/material.dart';

class ThemeProvide with ChangeNotifier {
  ThemeData themeData = ThemeData(primaryColor: Colors.pink);
  Locale locale;
  Locale platformLocale;

  refreshThem(ThemeData theme) {
    themeData = theme;
    notifyListeners();
  }
}
