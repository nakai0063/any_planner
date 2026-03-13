import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import '../../domain/models/user_settings.dart';
import '../database/app_database.dart';

class SettingsRepository {
  final AppDatabase _db;

  SettingsRepository(this._db);

  Future<UserSettings> getSettings() async {
    final row = await _db.getSettings();
    return _toDomain(row);
  }

  Stream<UserSettings> watchSettings() {
    return _db.watchSettings().map(_toDomain);
  }

  Future<void> updateWakeTime(TimeOfDay time) async {
    final current = await _db.getSettings();
    await _db.updateSettings(UserSettingsTableCompanion(
      id: const Value(1),
      wakeHour: Value(time.hour),
      wakeMinute: Value(time.minute),
      sleepHour: Value(current.sleepHour),
      sleepMinute: Value(current.sleepMinute),
      reminderBeforeMinutes: Value(current.reminderBeforeMinutes),
      snoozeMinutes: Value(current.snoozeMinutes),
      notificationsEnabled: Value(current.notificationsEnabled),
    ));
  }

  Future<void> updateSleepTime(TimeOfDay time) async {
    final current = await _db.getSettings();
    await _db.updateSettings(UserSettingsTableCompanion(
      id: const Value(1),
      wakeHour: Value(current.wakeHour),
      wakeMinute: Value(current.wakeMinute),
      sleepHour: Value(time.hour),
      sleepMinute: Value(time.minute),
      reminderBeforeMinutes: Value(current.reminderBeforeMinutes),
      snoozeMinutes: Value(current.snoozeMinutes),
      notificationsEnabled: Value(current.notificationsEnabled),
    ));
  }

  static UserSettings _toDomain(UserSettingsTableData row) {
    return UserSettings(
      wakeTime: TimeOfDay(hour: row.wakeHour, minute: row.wakeMinute),
      sleepTime: TimeOfDay(hour: row.sleepHour, minute: row.sleepMinute),
      reminderBeforeMinutes: row.reminderBeforeMinutes,
      snoozeMinutes: row.snoozeMinutes,
      notificationsEnabled: row.notificationsEnabled,
    );
  }
}
