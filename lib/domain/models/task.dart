import 'package:freezed_annotation/freezed_annotation.dart';
import 'task_status.dart';
import 'task_type.dart';

part 'task.freezed.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String id,
    required String title,
    required TaskType type,
    @Default(TaskStatus.pending) TaskStatus status,
    required DateTime targetDate,
    DateTime? scheduledStart,
    int? durationMinutes,
    String? memo,
    String? iconName,
    int? colorValue,
    @Default(false) bool isPinned,
    String? routineId,
    @Default(0) int snoozeCount,
    DateTime? snoozedUntil,
    @Default(0) int sortOrder,
    DateTime? deadline,
    DateTime? completedAt,
    @Default([]) List<String> images,
    @Default(false) bool moveToLaterWhenOverdue,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Task;
}
