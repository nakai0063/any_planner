import 'package:drift/drift.dart';

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  IntColumn get type => intEnum<TaskTypeIndex>()();
  IntColumn get status => intEnum<TaskStatusIndex>()();
  DateTimeColumn get targetDate => dateTime()();
  DateTimeColumn get scheduledStart => dateTime().nullable()();
  IntColumn get durationMinutes => integer().nullable()();
  TextColumn get memo => text().nullable()();
  TextColumn get iconName => text().nullable()();
  IntColumn get colorValue => integer().nullable()();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  TextColumn get routineId => text().nullable()();
  IntColumn get snoozeCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get snoozedUntil => dateTime().nullable()();
  IntColumn get sortOrder => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

// Drift intEnum requires an enum with index mapping
enum TaskTypeIndex { later, scheduled, recurring }

enum TaskStatusIndex { pending, done, snoozed, skipped }
