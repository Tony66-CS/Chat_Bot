import 'package:flutter/material.dart';
import '../../core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ColorsManager.blue,
          selectedItemColor: ColorsManager.ofWhite,
          unselectedItemColor: ColorsManager.black,
          type: BottomNavigationBarType.fixed));
  static final ThemeData dark = ThemeData();
}
