import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/models/task.dart' as domain;
import '../../domain/models/task_status.dart';
import '../timeline/providers.dart';

class LaterListSheet extends ConsumerStatefulWidget {
  const LaterListSheet({super.key});

  @override
  ConsumerState<LaterListSheet> createState() => _LaterListSheetState();
}

class _LaterListSheetState extends ConsumerState<LaterListSheet> {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    final laterAsync = ref.watch(laterTasksProvider);

    return DraggableScrollableSheet(
      controller: _sheetController,
      initialChildSize: 0.12,
      minChildSize: 0.08,
      maxChildSize: 0.5,
      expand: false,
      snap: true,
      snapSizes: const [0.12, 0.35, 0.5],
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 10,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Handle
              GestureDetector(
                onTap: () {
                  final current = _sheetController.size;
                  _sheetController.animateTo(
                    current < 0.2 ? 0.35 : 0.12,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.textHint,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      const SizedBox(height: 8),
                      laterAsync.when(
                        data: (tasks) => Text(
                          'あとでやる（${tasks.length}）',
                          style: AppTypography.subtitle,
                        ),
                        loading: () => Text('あとでやる', style: AppTypography.subtitle),
                        error: (_, _) => Text('あとでやる', style: AppTypography.subtitle),
                      ),
                    ],
                  ),
                ),
              ),
              // List
              Expanded(
                child: laterAsync.when(
                  data: (tasks) => tasks.isEmpty
                      ? Center(
                          child: Text(
                            'タスクを追加してみましょう',
                            style: AppTypography.caption,
                          ),
                        )
                      : ListView.builder(
                          controller: scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: tasks.length,
                          itemBuilder: (context, index) =>
                              _LaterTaskTile(task: tasks[index]),
                        ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('$e')),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LaterTaskTile extends ConsumerWidget {
  final domain.Task task;

  const _LaterTaskTile({required this.task});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardColor = task.colorValue != null
        ? Color(task.colorValue!)
        : AppColors.pastelYellow;

    return LongPressDraggable<String>(
      data: task.id,
      feedback: Material(
        elevation: 8,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 240,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(task.title, style: AppTypography.taskTitle),
        ),
      ),
      childWhenDragging: Opacity(
        opacity: 0.3,
        child: _buildTile(cardColor, ref),
      ),
      child: _buildTile(cardColor, ref),
    );
  }

  Widget _buildTile(Color cardColor, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              final repo = ref.read(taskRepositoryProvider);
              repo.updateTaskStatus(task.id, TaskStatus.done);
            },
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.textHint, width: 1.5),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              task.title,
              style: AppTypography.taskTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (task.durationMinutes != null)
            Text(
              '${task.durationMinutes}分',
              style: AppTypography.taskDuration,
            ),
        ],
      ),
    );
  }
}
