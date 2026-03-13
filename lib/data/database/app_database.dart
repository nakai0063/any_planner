import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import '../tables/tasks_table.dart';
import '../tables/user_settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tasks, UserSettingsTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  // --- Task CRUD ---

  Future<List<Task>> getTasksForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) => t.targetDate.isBetweenValues(startOfDay, endOfDay))
          ..orderBy([
            (t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.scheduledStart),
          ]))
        .get();
  }

  Stream<List<Task>> watchTasksForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) => t.targetDate.isBetweenValues(startOfDay, endOfDay))
          ..orderBy([
            (t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.sortOrder),
            (t) => OrderingTerm(expression: t.scheduledStart),
          ]))
        .watch();
  }

  Future<List<Task>> getLaterTasks(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) =>
              t.targetDate.isBetweenValues(startOfDay, endOfDay) &
              t.type.equalsValue(TaskTypeIndex.later) &
              t.status.equalsValue(TaskStatusIndex.pending))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Stream<List<Task>> watchLaterTasks(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) =>
              t.targetDate.isBetweenValues(startOfDay, endOfDay) &
              t.type.equalsValue(TaskTypeIndex.later) &
              t.status.equalsValue(TaskStatusIndex.pending))
          ..orderBy([
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .watch();
  }

  Future<List<Task>> getScheduledTasks(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) =>
              t.targetDate.isBetweenValues(startOfDay, endOfDay) &
              t.type.isNotValue(TaskTypeIndex.later.index))
          ..orderBy([
            (t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.scheduledStart),
          ]))
        .get();
  }

  Stream<List<Task>> watchScheduledTasks(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return (select(tasks)
          ..where((t) =>
              t.targetDate.isBetweenValues(startOfDay, endOfDay) &
              t.type.isNotValue(TaskTypeIndex.later.index))
          ..orderBy([
            (t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.scheduledStart),
          ]))
        .watch();
  }

  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);

  Future<bool> updateTask(TasksCompanion task) => update(tasks).replace(task);

  Future<int> deleteTask(String id) =>
      (delete(tasks)..where((t) => t.id.equals(id))).go();

  // --- Settings ---

  Future<UserSettingsTableData> getSettings() async {
    final result = await select(userSettingsTable).getSingleOrNull();
    if (result != null) return result;
    await into(userSettingsTable)
        .insert(UserSettingsTableCompanion.insert());
    return select(userSettingsTable).getSingle();
  }

  Stream<UserSettingsTableData> watchSettings() {
    return select(userSettingsTable).watchSingle();
  }

  Future<bool> updateSettings(UserSettingsTableCompanion settings) =>
      update(userSettingsTable).replace(settings);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'any_planner.db'));
    return NativeDatabase.createInBackground(file);
  });
}
