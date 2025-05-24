import 'package:flutter/material.dart';

import 'colors.dart';

class Themes {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.secondary,
      foregroundColor: AppColors.secondary,
      surfaceTintColor: AppColors.secondary,
    ),
    canvasColor: AppColors.white,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        color: AppColors.white,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(color: AppColors.white, fontSize: 14),
    ),
  );
}
