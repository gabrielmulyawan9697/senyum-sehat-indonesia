import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF1FA98C); // teal kehijauan, kesan sehat
  static const Color primaryDark = Color(0xFF0E7C67);
  static const Color accent = Color(0xFFFFC857); // aksen kuning hangat, kesan senyum
  static const Color background = Color(0xFFFAFDFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1B2B29);
  static const Color textMuted = Color(0xFF5C6B69);
}

class AppBreakpoints {
  static const double mobile = 700;
  static const double tablet = 1050;
}

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < AppBreakpoints.mobile;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= AppBreakpoints.mobile &&
    MediaQuery.of(context).size.width < AppBreakpoints.tablet;

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
    ),
    fontFamily: 'Poppins',
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: AppColors.textDark,
      ),
      bodyLarge: TextStyle(color: AppColors.textMuted, height: 1.5),
      bodyMedium: TextStyle(color: AppColors.textMuted, height: 1.5),
    ),
  );
}
