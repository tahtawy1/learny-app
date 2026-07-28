import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Cairo';

  /// 38 - App Logo
  static const displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 38,
    fontWeight: FontWeight.w700,
    height: 40 / 38,
    letterSpacing: -0.5,
  );

  /// 32 - Display Medium
  static const displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.5,
  );

  /// 30 - Screen Title
  static const headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 36 / 30,
    letterSpacing: 0,
  );

  /// 24 - Section Title
  static const headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: 0,
  );

  /// 20 - Secondary Title
  static const headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
    letterSpacing: -0.5,
  );

  /// 18 - Button / Card Title
  static const titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 28 / 18,
    letterSpacing: 0,
  );

  /// 14 - Small Button / Tab / Chip
  static const titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 12 - Title Small
  static const titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  /// 16 - Body / Input Text
  static const bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    letterSpacing: 0,
  );

  /// 15 - Description
  static const bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 24 / 15,
    letterSpacing: 0,
  );

  /// 12 - Body Small
  static const bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  /// 14 - Field Label
  static const labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 14 - Subtitle
  static const labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0,
  );

  /// 12 - Caption / Hint
  static const labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    letterSpacing: 0,
  );

  static const TextTheme textTheme = TextTheme(
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
