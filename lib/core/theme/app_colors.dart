import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary palette
  static const primary = Color(0xFF6C63FF);
  static const primaryLight = Color(0xFF9D97FF);
  static const primaryDark = Color(0xFF4A42DB);

  // Background
  static const background = Color(0xFFF8F7FC);
  static const surface = Colors.white;
  static const surfaceVariant = Color(0xFFF0EEF8);

  // Text
  static const textPrimary = Color(0xFF2D2B3D);
  static const textSecondary = Color(0xFF8E8CA0);
  static const textHint = Color(0xFFB8B6C8);

  // Pastel task colors
  static const pastelPink = Color(0xFFFFD6E0);
  static const pastelBlue = Color(0xFFD6E5FF);
  static const pastelGreen = Color(0xFFD6FFE0);
  static const pastelYellow = Color(0xFFFFF3D6);
  static const pastelPurple = Color(0xFFE8D6FF);
  static const pastelOrange = Color(0xFFFFE0D6);
  static const pastelMint = Color(0xFFD6FFF0);
  static const pastelLavender = Color(0xFFF0D6FF);

  static const taskColors = [
    pastelPink,
    pastelBlue,
    pastelGreen,
    pastelYellow,
    pastelPurple,
    pastelOrange,
    pastelMint,
    pastelLavender,
  ];

  // Semantic
  static const done = Color(0xFF4CAF50);
  static const snoozed = Color(0xFFFF9800);
  static const skipped = Color(0xFF9E9E9E);
  static const currentTimeLine = Color(0xFFFF5252);

  // Calendar events
  static const calendarEvent = Color(0xFFE3F2FD);
  static const calendarEventBorder = Color(0xFF90CAF9);

  // Free time
  static const freeTime = Color(0xFFE8F5E9);
}
