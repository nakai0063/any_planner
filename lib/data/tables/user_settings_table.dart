import 'package:drift/drift.dart';

class UserSettingsTable extends Table {
  IntColumn get id => integer().withDefault(const Constant(1))();
  IntColumn get wakeHour => integer().withDefault(const Constant(7))();
  IntColumn get wakeMinute => integer().withDefault(const Constant(0))();
  IntColumn get sleepHour => integer().withDefault(const Constant(23))();
  IntColumn get sleepMinute => integer().withDefault(const Constant(0))();
  IntColumn get reminderBeforeMinutes =>
      integer().withDefault(const Constant(5))();
  IntColumn get snoozeMinutes => integer().withDefault(const Constant(15))();
  BoolColumn get notificationsEnabled =>
      boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};

  @override
  String get tableName => 'user_settings';
}
