import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ===== Primary =====
  static const Color primary = Color(0xFF2A7E4F);
  static const Color primaryLight = Color(0xFF2E8B57);
  static const Color primaryDark = Color(0xFF256F46);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      Color(0xFF256F46),
      Color(0xFF2E8B57),
      Color(0xFF14B8A6),
    ],
  );

  // ===== Background & Surface =====
  static const Color background = Color(0xFFFFFFFF);
  static const Color scaffold = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFF1F5F9);

  // ===== Text =====
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textHint = Color(0xFF94A3B8);

  // ===== Border =====
  static const Color border = Color(0xFFE2E8F0);
  static const Color divider = Color(0xFFE2E8F0);

  // ===== Status =====
  static const Color success = Color(0xFF2E8B57);
  static const Color successLight = Color(0xFFD0FCE7);

  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);

  // ===== Accent =====
  static const Color blue = Color(0xFF38BDF8);
  static const Color blueLight = Color(0xFFDBEAFE);
  static const Color teal = Color(0xFF14B8A6);

  // ===== Common =====
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  // ===== Greyscale Ramp (Legacy) =====
  static const Color grey1 = Color(0xFF1A1A1A);
  static const Color grey2 = Color(0xFF333333);
  static const Color grey3 = Color(0xFF4D4D4D);
  static const Color grey4 = Color(0xFF666666);
  static const Color grey5 = Color(0xFF808080);
  static const Color grey6 = Color(0xFF979797);
  static const Color grey7 = Color(0xFF999999);
  static const Color grey8 = Color(0xFFB3B3B3);
  static const Color grey9 = Color(0xFFCCCCCC);
  static const Color grey10 = Color(0xFFE6E6E6);

  // ===== Accent & Custom (Legacy) =====
  static const Color green = Color(0xFF0C9409);
  static const Color red = Color(0xFFED1010);
  static const Color shadow = Colors.black38;
  static const Color bgIndicatorColor = Color(0xFFBBBBBB);
}
