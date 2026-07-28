import 'package:flutter/material.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:learny/core/theme/app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => lightTheme;
  static ThemeData get dark => darkTheme;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.scaffold,

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        onPrimary: AppColors.white,
        secondary: AppColors.teal,
        onSecondary: AppColors.white,
        surface: AppColors.background,
        onSurface: AppColors.textPrimary,
        onSurfaceVariant: AppColors.textSecondary,
        error: AppColors.error,
        onError: AppColors.white,
        outline: AppColors.border,
        shadow: AppColors.grey1.withValues(alpha: 0.1),
      ),

      textTheme: AppTextStyles.textTheme,
      dividerColor: AppColors.divider,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: AppTextStyles.titleLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          textStyle: AppTextStyles.titleLarge,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppTextStyles.fontFamily,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.grey1,

      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryLight,
        onPrimary: AppColors.white,
        secondary: AppColors.teal,
        onSecondary: AppColors.white,
        surface: AppColors.grey2,
        onSurface: AppColors.white,
        onSurfaceVariant: AppColors.grey8,
        error: AppColors.error,
        onError: AppColors.white,
        outline: AppColors.grey4,
        shadow: AppColors.black.withValues(alpha: 0.3),
      ),

      textTheme: AppTextStyles.textTheme,
      dividerColor: AppColors.grey4,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.white,
        surfaceTintColor: Colors.transparent,
      ),

      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grey2,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey4),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error, width: 1.5),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.white,
          elevation: 0,
          textStyle: AppTextStyles.titleLarge,
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          side: const BorderSide(color: AppColors.primaryLight),
          textStyle: AppTextStyles.titleLarge,
        ),
      ),
    );
  }
}
