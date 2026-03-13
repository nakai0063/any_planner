import 'package:uuid/uuid.dart';
import '../../domain/models/task.dart' as domain;
import '../../domain/models/task_status.dart';
import '../../domain/models/task_type.dart';
import '../database/app_database.dart';
import '../tables/tasks_table.dart';
import 'package:drift/drift.dart';

class TaskRepository {
  final AppDatabase _db;
  static const _uuid = Uuid();

  TaskRepository(this._db);

  Stream<List<domain.Task>> watchTasksForDate(DateTime date) {
    return _db.watchTasksForDate(date).map(
          (rows) => rows.map(_toDomain).toList(),
        );
  }

  Stream<List<domain.Task>> watchLaterTasks(DateTime date) {
    return _db.watchLaterTasks(date).map(
          (rows) => rows.map(_toDomain).toList(),
        );
  }

  Stream<List<domain.Task>> watchScheduledTasks(DateTime date) {
    return _db.watchScheduledTasks(date).map(
          (rows) => rows.map(_toDomain).toList(),
        );
  }

  Future<void> createTask({
    required String title,
    required TaskType type,
    required DateTime targetDate,
    DateTime? scheduledStart,
    int? durationMinutes,
    String? memo,
    String? iconName,
    int? colorValue,
  }) async {
    final now = DateTime.now();
    final id = _uuid.v4();
    await _db.insertTask(TasksCompanion.insert(
      id: id,
      title: title,
      type: _typeToIndex(type),
      status: TaskStatusIndex.pending,
      targetDate: targetDate,
      scheduledStart: Value(scheduledStart),
      durationMinutes: Value(durationMinutes),
      memo: Value(memo),
      iconName: Value(iconName),
      colorValue: Value(colorValue),
      createdAt: now,
      updatedAt: now,
    ));
  }

  Future<void> updateTaskStatus(String id, TaskStatus status) async {
    final existing = await _db.getTasksForDate(DateTime.now());
    final task = existing.firstWhere((t) => t.id == id);
    await _db.updateTask(TasksCompanion(
      id: Value(task.id),
      title: Value(task.title),
      type: Value(task.type),
      status: Value(_statusToIndex(status)),
      targetDate: Value(task.targetDate),
      scheduledStart: Value(task.scheduledStart),
      durationMinutes: Value(task.durationMinutes),
      memo: Value(task.memo),
      iconName: Value(task.iconName),
      colorValue: Value(task.colorValue),
      isPinned: Value(task.isPinned),
      routineId: Value(task.routineId),
      snoozeCount: Value(task.snoozeCount),
      snoozedUntil: Value(task.snoozedUntil),
      sortOrder: Value(task.sortOrder),
      createdAt: Value(task.createdAt),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> scheduleTask(String id, DateTime startTime,
      {int? durationMinutes}) async {
    // Read current task then update
    final rows = await _db.getTasksForDate(startTime);
    final task = rows.firstWhere((t) => t.id == id);
    await _db.updateTask(TasksCompanion(
      id: Value(task.id),
      title: Value(task.title),
      type: Value(TaskTypeIndex.scheduled),
      status: Value(task.status),
      targetDate: Value(task.targetDate),
      scheduledStart: Value(startTime),
      durationMinutes: Value(durationMinutes ?? task.durationMinutes),
      memo: Value(task.memo),
      iconName: Value(task.iconName),
      colorValue: Value(task.colorValue),
      isPinned: Value(task.isPinned),
      routineId: Value(task.routineId),
      snoozeCount: Value(task.snoozeCount),
      snoozedUntil: Value(task.snoozedUntil),
      sortOrder: Value(task.sortOrder),
      createdAt: Value(task.createdAt),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> moveToLater(String id) async {
    final rows = await _db.getTasksForDate(DateTime.now());
    final task = rows.firstWhere((t) => t.id == id);
    await _db.updateTask(TasksCompanion(
      id: Value(task.id),
      title: Value(task.title),
      type: Value(TaskTypeIndex.later),
      status: Value(task.status),
      targetDate: Value(task.targetDate),
      scheduledStart: const Value(null),
      durationMinutes: Value(task.durationMinutes),
      memo: Value(task.memo),
      iconName: Value(task.iconName),
      colorValue: Value(task.colorValue),
      isPinned: Value(task.isPinned),
      routineId: Value(task.routineId),
      snoozeCount: Value(task.snoozeCount),
      snoozedUntil: Value(task.snoozedUntil),
      sortOrder: Value(task.sortOrder),
      createdAt: Value(task.createdAt),
      updatedAt: Value(DateTime.now()),
    ));
  }

  Future<void> deleteTask(String id) => _db.deleteTask(id);

  // --- Mapping ---

  static domain.Task _toDomain(Task row) {
    return domain.Task(
      id: row.id,
      title: row.title,
      type: _indexToType(row.type),
      status: _indexToStatus(row.status),
      targetDate: row.targetDate,
      scheduledStart: row.scheduledStart,
      durationMinutes: row.durationMinutes,
      memo: row.memo,
      iconName: row.iconName,
      colorValue: row.colorValue,
      isPinned: row.isPinned,
      routineId: row.routineId,
      snoozeCount: row.snoozeCount,
      snoozedUntil: row.snoozedUntil,
      sortOrder: row.sortOrder,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  static TaskType _indexToType(TaskTypeIndex idx) {
    switch (idx) {
      case TaskTypeIndex.later:
        return TaskType.later;
      case TaskTypeIndex.scheduled:
        return TaskType.scheduled;
      case TaskTypeIndex.recurring:
        return TaskType.recurring;
    }
  }

  static TaskStatusIndex _statusToIndex(TaskStatus s) {
    switch (s) {
      case TaskStatus.pending:
        return TaskStatusIndex.pending;
      case TaskStatus.done:
        return TaskStatusIndex.done;
      case TaskStatus.snoozed:
        return TaskStatusIndex.snoozed;
      case TaskStatus.skipped:
        return TaskStatusIndex.skipped;
    }
  }

  static TaskStatus _indexToStatus(TaskStatusIndex idx) {
    switch (idx) {
      case TaskStatusIndex.pending:
        return TaskStatus.pending;
      case TaskStatusIndex.done:
        return TaskStatus.done;
      case TaskStatusIndex.snoozed:
        return TaskStatus.snoozed;
      case TaskStatusIndex.skipped:
        return TaskStatus.skipped;
    }
  }

  static TaskTypeIndex _typeToIndex(TaskType t) {
    switch (t) {
      case TaskType.later:
        return TaskTypeIndex.later;
      case TaskType.scheduled:
        return TaskTypeIndex.scheduled;
      case TaskType.recurring:
        return TaskTypeIndex.recurring;
    }
  }
}
