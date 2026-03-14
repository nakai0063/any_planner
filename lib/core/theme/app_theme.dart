import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'theme_config.dart';

class AppTheme {
  AppTheme._();

  static ThemeData fromConfig(ThemeId themeId, {required bool isDark}) {
    final primary = themeId.primaryColor;
    final primaryLight = themeId.primaryLight;

    final colorScheme = isDark
        ? ColorScheme.dark(
            primary: primary,
            onPrimary: Colors.white,
            secondary: primaryLight,
            surface: const Color(0xFF1C1B1F),
            onSurface: const Color(0xFFE6E1E5),
          )
        : ColorScheme.light(
            primary: primary,
            onPrimary: Colors.white,
            secondary: primaryLight,
            surface: AppColors.surface,
            onSurface: AppColors.textPrimary,
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor:
          isDark ? const Color(0xFF141218) : AppColors.background,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDark ? const Color(0xFF141218) : AppColors.background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: isDark ? const Color(0xFFE6E1E5) : AppColors.textPrimary,
        ),
        iconTheme: IconThemeData(
          color: isDark ? const Color(0xFFE6E1E5) : AppColors.textPrimary,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: const CircleBorder(),
      ),
      cardTheme: CardThemeData(
        color: isDark ? const Color(0xFF2B2930) : AppColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: isDark ? const Color(0xFF2B2930) : AppColors.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor:
            isDark ? const Color(0xFF2B2930) : AppColors.surfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  // Backwards-compatible default
  static ThemeData get light =>
      fromConfig(ThemeId.defaultTheme, isDark: false);
}
