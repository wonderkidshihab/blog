import 'package:blog/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static themeData() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,
        secondary: AppColors.secondaryColor,
        primary: AppColors.primaryColor,
      ),
      fontFamily: 'Space Grotesk',
      useMaterial3: true,
      // All text should be bold
      textTheme: GoogleFonts.spaceGroteskTextTheme(
        const TextTheme(
          displayLarge: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w700,
            letterSpacing: -1.5,
          ),
          displayMedium: TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.25,
          ),
          headlineSmall: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.1,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.25,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.25,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.4,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColors.dark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      scaffoldBackgroundColor: AppColors.light,
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primaryColor,
        textTheme: ButtonTextTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.light,
        filled: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColors.error,
        ),
        labelStyle: const TextStyle(
          color: AppColors.dark,
        ),
        hintStyle: TextStyle(
          color: AppColors.dark.withOpacity(0.5),
        ),
      ),
    );
  }
}
