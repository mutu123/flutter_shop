import 'package:flutter/material.dart';

class ThemeDataManager {
  static const String KEY_CURRENT_THEME = "key_current_theme";

  static const Color themeColorDefault = Colors.blue;

  static const MaterialColor darkSwatch = const MaterialColor(
    0xFF24292E,
    const <int, Color>{
      50: const Color(0xFF42464b),
      100: const Color(0xFF42464b),
      200: const Color(0xFF42464b),
      300: const Color(0xFF42464b),
      400: const Color(0xFF42464b),
      500: const Color(0xFF24292E),
      600: const Color(0xFF121917),
      700: const Color(0xFF121917),
      800: const Color(0xFF121917),
      900: const Color(0xFF121917),
    },
  );

  static List<Color> themeColorList = [
    themeColorDefault,
    Colors.green,
    Colors.brown,
    Colors.red,
    Colors.amber,
    Colors.indigo,
    darkSwatch,
  ];
}
