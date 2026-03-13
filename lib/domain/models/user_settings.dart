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
  }) = _UserSettings;
}
