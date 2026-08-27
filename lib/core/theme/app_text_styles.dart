import 'package:flutter/material.dart';
import 'package:learny/core/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static String fontFamily = 'Cairo';

  /// 38 - App Logo
  static final displayLarge = GoogleFonts.cairo(
    fontSize: 38,
    fontWeight: FontWeight.w500,

    color: AppColors.primary,
    height: 1.2,
  );

  /// 32 - Display Medium
  static final displayMedium = GoogleFonts.cairo(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  /// 30 - Screen Title
  static final headlineLarge = GoogleFonts.cairo(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 36 / 30,
    letterSpacing: 0,
  );

  /// 24 - Section Title
  static final headlineMedium = GoogleFonts.cairo(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: 0,
  );

  /// 20 - Secondary Title
  static final headlineSmall = GoogleFonts.cairo(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
    letterSpacing: -0.5,
  );

  /// 18 - Button / Card Title
  static final titleLarge = GoogleFonts.cairo(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 28 / 18,
    letterSpacing: 0,
  );

  /// 14 - Small Button / Tab / Chip
  static final titleMedium = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 12 - Title Small
  static final titleSmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  /// 16 - Body / Input Text
  static final bodyLarge = GoogleFonts.cairo(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// 15 - Description
  static final bodyMedium = GoogleFonts.cairo(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 24 / 15,
    letterSpacing: 0,
  );

  /// 12 - Body Small
  static final bodySmall = GoogleFonts.cairo(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// 14 - Field Label
  static final labelLarge = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 14 - Subtitle
  static final labelMedium = GoogleFonts.cairo(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 12 - Caption / Hint
  static final labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0,
  );

  static final TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}
