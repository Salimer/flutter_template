import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData _baseTheme() {
    final ThemeData theme = ThemeData.light();
    return theme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          minimumSize: Size.zero,
        ),
      ),
      textTheme: theme.textTheme.apply(),
    );
  }

  static ThemeData get lightTheme => _baseTheme().copyWith(
        scaffoldBackgroundColor: Colors.white,
      );

  static ThemeData get darkTheme => _baseTheme().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
      );
}
