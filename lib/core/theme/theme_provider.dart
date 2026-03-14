import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers.dart';
import '../../features/timeline/providers.dart';
import 'app_theme.dart';
import 'theme_config.dart';

final activeThemeIdProvider = Provider<ThemeId>((ref) {
  final settingsAsync = ref.watch(settingsProvider);
  final themeIdStr = settingsAsync.valueOrNull?.themeId ?? 'default';
  return ThemeId.fromId(themeIdStr);
});

final themeModeProvider = Provider<ThemeMode>((ref) {
  final settingsAsync = ref.watch(settingsProvider);
  final darkMode = settingsAsync.valueOrNull?.darkMode ?? 'system';
  switch (darkMode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
});

final lightThemeProvider = Provider<ThemeData>((ref) {
  final themeId = ref.watch(activeThemeIdProvider);
  return AppTheme.fromConfig(themeId, isDark: false);
});

final darkThemeProvider = Provider<ThemeData>((ref) {
  final themeId = ref.watch(activeThemeIdProvider);
  return AppTheme.fromConfig(themeId, isDark: true);
});
