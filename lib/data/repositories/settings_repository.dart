import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../domain/models/user_settings.dart';

class SettingsRepository {
  final FirebaseFirestore _firestore;

  SettingsRepository(this._firestore);

  String? get _uid => FirebaseAuth.instance.currentUser?.uid;

  DocumentReference<Map<String, dynamic>> _settingsDoc(String uid) =>
      _firestore.doc('users/$uid/settings/userSettings');

  Future<UserSettings> getSettings() async {
    final uid = _uid;
    if (uid == null) return const UserSettings();
    final doc = await _settingsDoc(uid).get();
    if (!doc.exists || doc.data() == null) return const UserSettings();
    return _fromMap(doc.data()!);
  }

  Stream<UserSettings> watchSettings() {
    final uid = _uid;
    if (uid == null) return Stream.value(const UserSettings());

    return _settingsDoc(uid).snapshots().map((doc) {
      if (!doc.exists || doc.data() == null) return const UserSettings();
      return _fromMap(doc.data()!);
    });
  }

  Future<void> updateSettings(UserSettings settings) async {
    final uid = _uid;
    if (uid == null) return;
    await _settingsDoc(uid).set(_toMap(settings), SetOptions(merge: true));
  }

  Future<void> updateWakeTime(TimeOfDay time) async {
    final current = await getSettings();
    await updateSettings(current.copyWith(wakeTime: time));
  }

  Future<void> updateSleepTime(TimeOfDay time) async {
    final current = await getSettings();
    await updateSettings(current.copyWith(sleepTime: time));
  }

  static Map<String, dynamic> _toMap(UserSettings s) => {
        'wakeHour': s.wakeTime.hour,
        'wakeMinute': s.wakeTime.minute,
        'sleepHour': s.sleepTime.hour,
        'sleepMinute': s.sleepTime.minute,
        'reminderBeforeMinutes': s.reminderBeforeMinutes,
        'snoozeMinutes': s.snoozeMinutes,
        'notificationsEnabled': s.notificationsEnabled,
        'themeId': s.themeId,
        'darkMode': s.darkMode,
        'language': s.language,
        'firstDayOfWeek': s.firstDayOfWeek,
        'incompleteReminderDelay': s.incompleteReminderDelay,
        'calendarSyncEnabled': s.calendarSyncEnabled,
        'allDayNotificationHour': s.allDayNotificationHour,
        'allDayNotificationMinute': s.allDayNotificationMinute,
      };

  static UserSettings _fromMap(Map<String, dynamic> data) => UserSettings(
        wakeTime: TimeOfDay(
          hour: data['wakeHour'] as int? ?? 7,
          minute: data['wakeMinute'] as int? ?? 0,
        ),
        sleepTime: TimeOfDay(
          hour: data['sleepHour'] as int? ?? 23,
          minute: data['sleepMinute'] as int? ?? 0,
        ),
        reminderBeforeMinutes:
            data['reminderBeforeMinutes'] as int? ?? 5,
        snoozeMinutes: data['snoozeMinutes'] as int? ?? 15,
        notificationsEnabled:
            data['notificationsEnabled'] as bool? ?? true,
        themeId: data['themeId'] as String? ?? 'default',
        darkMode: data['darkMode'] as String? ?? 'system',
        language: data['language'] as String? ?? 'ja',
        firstDayOfWeek: data['firstDayOfWeek'] as int? ?? 1,
        incompleteReminderDelay:
            data['incompleteReminderDelay'] as int? ?? 30,
        calendarSyncEnabled:
            data['calendarSyncEnabled'] as bool? ?? false,
        allDayNotificationHour:
            data['allDayNotificationHour'] as int? ?? 9,
        allDayNotificationMinute:
            data['allDayNotificationMinute'] as int? ?? 0,
      );
}
