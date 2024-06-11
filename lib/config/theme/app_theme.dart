import 'package:flutter/material.dart';

const Color customColor = Color(0xFF49149F);

const List<Color> colorThemes = [
  customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'Colors must be between 0 and ${colorThemes.length - 1}');

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: colorThemes[selectedColor]);
  }
}
