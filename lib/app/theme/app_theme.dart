import 'package:flutter/material.dart';
import 'package:study_expense_planner/app/theme/app_colors.dart';

/// The AppTheme class is a singleton class that returns a default theme for the app
class AppTheme {
  AppTheme._internal();

  static final AppTheme instance = AppTheme._internal();

  factory AppTheme() {
    return instance;
  }

  /// Returning a ThemeData object.
  ThemeData get defaultTheme => ThemeData(
        primaryColor: AppColors.primaryColor,
        appBarTheme: defaultAppBarTheme,
        cardTheme: defaultCardTheme,
        elevatedButtonTheme: defaultElevatedButtonTheme,
        textButtonTheme: defaultTextButtonTheme,
      );

  /// Returning an AppBarTheme object.
  AppBarTheme get defaultAppBarTheme => AppBarTheme(
        color: AppColors.primaryColor,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w400,
        ),
      );

  /// Returning a CardTheme object.
  CardTheme get defaultCardTheme => const CardTheme(
        color: Colors.white,
        margin: EdgeInsets.all(12),
      );

  /// Returning a ElevatedButtonThemeData object.
  ElevatedButtonThemeData get defaultElevatedButtonTheme =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 15,
            bottom: 15,
          ),
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  TextButtonThemeData get defaultTextButtonTheme => TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
        ),
      );
}
