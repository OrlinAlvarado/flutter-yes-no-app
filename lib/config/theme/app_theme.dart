import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF49149F);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.yellow,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  final int selectedColorIndex;
  final Color? selectedColor;
  final bool isDark;

  AppTheme({this.selectedColorIndex = 0, this.selectedColor, this.isDark = false })
      : assert(
            selectedColorIndex >= 0 &&
                selectedColorIndex <= _colorThemes.length - 1,
            'Colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: selectedColor ?? _colorThemes[selectedColorIndex],
      brightness: isDark ? Brightness.dark : null
    );
  }
}
