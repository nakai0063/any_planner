import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'user_settings.freezed.dart';

@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    @Default(TimeOfDay(hour: 7, minute: 0)) TimeOfDay wakeTime,
    @Default(TimeOfDay(hour: 23, minute: 0)) TimeOfDay sleepTime,
    @Default(5) int reminderBeforeMinutes,
    @Default(15) int snoozeMinutes,
    @Default(true) bool notificationsEnabled,
    @Default('default') String themeId,
    @Default('system') String darkMode,
    @Default('ja') String language,
    @Default(1) int firstDayOfWeek,
    @Default(30) int incompleteReminderDelay,
    @Default(false) bool calendarSyncEnabled,
    @Default(9) int allDayNotificationHour,
    @Default(0) int allDayNotificationMinute,
  }) = _UserSettings;
}
