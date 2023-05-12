import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color.fromARGB(255, 32, 32, 32),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF6200EE),
        secondary: Color(0xFF03DAC6),
        surface: Color(0xFF121212),
        background: Color(0xFF121212),
        error: Color(0xFFB00020),
        onPrimary: Color(0xFFFFFFFF),
        onSecondary: Color(0xFF000000),
        onSurface: Color(0xFFFFFFFF),
        onBackground: Color(0xFFFFFFFF),
        onError: Color(0xFFFFFFFF),
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Color(0xFFFFFFFF),
        titleTextStyle: TextStyle(
          color: Color(0xFFFFFFFF),
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        filled: true,
        fillColor: Color(0xFF121212),
        labelStyle: TextStyle(
          color: Color(0xFFB00020),
        ),
        hintStyle: TextStyle(
          color: Color(0xFFB00020),
        ),
        alignLabelWithHint: true,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFF6200EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF6200EE),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF6200EE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
