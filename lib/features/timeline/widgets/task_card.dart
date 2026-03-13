import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/extensions/datetime_ext.dart';
import '../../../domain/models/task.dart';
import '../../../domain/models/task_status.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  final VoidCallback? onTap;
  final VoidCallback? onDone;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onDone,
  });

  Color get _cardColor {
    if (task.status == TaskStatus.done) {
      return AppColors.done.withValues(alpha: 0.1);
    }
    if (task.colorValue != null) {
      return Color(task.colorValue!);
    }
    return AppColors.pastelBlue;
  }

  @override
  Widget build(BuildContext context) {
    final isDone = task.status == TaskStatus.done;

    return LongPressDraggable<String>(
      data: task.id,
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          width: 260,
          child: _buildCard(isDone, isDragging: true),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildCard(isDone),
      ),
      child: _buildCard(isDone),
    );
  }

  Widget _buildCard(bool isDone, {bool isDragging = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: _cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDragging
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            // Checkbox
            GestureDetector(
              onTap: onDone,
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isDone ? AppColors.done : AppColors.textHint,
                    width: 2,
                  ),
                  color: isDone ? AppColors.done : Colors.transparent,
                ),
                child: isDone
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            // Title + time
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    task.title,
                    style: AppTypography.taskTitle.copyWith(
                      decoration:
                          isDone ? TextDecoration.lineThrough : null,
                      color: isDone
                          ? AppColors.textHint
                          : AppColors.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (task.scheduledStart != null || task.durationMinutes != null)
                    Text(
                      _timeLabel(),
                      style: AppTypography.taskDuration,
                    ),
                ],
              ),
            ),
            // Icon
            if (task.iconName != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.circle,
                  size: 16,
                  color: AppColors.textHint,
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _timeLabel() {
    final parts = <String>[];
    if (task.scheduledStart != null) {
      final t = TimeOfDay.fromDateTime(task.scheduledStart!);
      parts.add(t.formatted);
    }
    if (task.durationMinutes != null) {
      parts.add('${task.durationMinutes}分');
    }
    return parts.join(' · ');
  }
}
