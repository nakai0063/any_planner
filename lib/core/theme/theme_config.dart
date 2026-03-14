import 'package:flutter/material.dart';

enum ThemeId {
  defaultTheme('default'),
  blueHorizon('blueHorizon'),
  blushHarmony('blushHarmony'),
  candyPop('candyPop'),
  cocoaDusk('cocoaDusk'),
  cottonBloom('cottonBloom'),
  crystalMist('crystalMist'),
  earthyMoss('earthyMoss'),
  midnightLinen('midnightLinen'),
  rosyOvercast('rosyOvercast'),
  violetDream('violetDream');

  final String id;
  const ThemeId(this.id);

  static ThemeId fromId(String id) => ThemeId.values.firstWhere(
        (t) => t.id == id,
        orElse: () => ThemeId.defaultTheme,
      );

  String get displayName {
    switch (this) {
      case ThemeId.defaultTheme:
        return 'Default';
      case ThemeId.blueHorizon:
        return 'Blue Horizon';
      case ThemeId.blushHarmony:
        return 'Blush Harmony';
      case ThemeId.candyPop:
        return 'Candy Pop';
      case ThemeId.cocoaDusk:
        return 'Cocoa Dusk';
      case ThemeId.cottonBloom:
        return 'Cotton Bloom';
      case ThemeId.crystalMist:
        return 'Crystal Mist';
      case ThemeId.earthyMoss:
        return 'Earthy Moss';
      case ThemeId.midnightLinen:
        return 'Midnight Linen';
      case ThemeId.rosyOvercast:
        return 'Rosy Overcast';
      case ThemeId.violetDream:
        return 'Violet Dream';
    }
  }

  Color get primaryColor {
    switch (this) {
      case ThemeId.defaultTheme:
        return const Color(0xFF6C63FF);
      case ThemeId.blueHorizon:
        return const Color(0xFF2563EB);
      case ThemeId.blushHarmony:
        return const Color(0xFFDB7093);
      case ThemeId.candyPop:
        return const Color(0xFFEC4899);
      case ThemeId.cocoaDusk:
        return const Color(0xFF92400E);
      case ThemeId.cottonBloom:
        return const Color(0xFFF472B6);
      case ThemeId.crystalMist:
        return const Color(0xFF0891B2);
      case ThemeId.earthyMoss:
        return const Color(0xFF4D7C0F);
      case ThemeId.midnightLinen:
        return const Color(0xFF1E3A5F);
      case ThemeId.rosyOvercast:
        return const Color(0xFFBE6B7F);
      case ThemeId.violetDream:
        return const Color(0xFF7C3AED);
    }
  }

  Color get primaryLight {
    switch (this) {
      case ThemeId.defaultTheme:
        return const Color(0xFF9D97FF);
      case ThemeId.blueHorizon:
        return const Color(0xFF60A5FA);
      case ThemeId.blushHarmony:
        return const Color(0xFFF4A0B0);
      case ThemeId.candyPop:
        return const Color(0xFFF9A8D4);
      case ThemeId.cocoaDusk:
        return const Color(0xFFD97706);
      case ThemeId.cottonBloom:
        return const Color(0xFFFBCFE8);
      case ThemeId.crystalMist:
        return const Color(0xFF22D3EE);
      case ThemeId.earthyMoss:
        return const Color(0xFF84CC16);
      case ThemeId.midnightLinen:
        return const Color(0xFF3B82F6);
      case ThemeId.rosyOvercast:
        return const Color(0xFFFDA4AF);
      case ThemeId.violetDream:
        return const Color(0xFFA78BFA);
    }
  }
}
