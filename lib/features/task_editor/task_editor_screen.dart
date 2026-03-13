import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/extensions/datetime_ext.dart';
import '../../core/providers.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/models/task.dart' as domain;
import '../../domain/models/task_type.dart';

class TaskEditorScreen extends ConsumerStatefulWidget {
  final domain.Task? existingTask;

  const TaskEditorScreen({super.key, this.existingTask});

  @override
  ConsumerState<TaskEditorScreen> createState() => _TaskEditorScreenState();
}

class _TaskEditorScreenState extends ConsumerState<TaskEditorScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _memoController;
  TaskType _taskType = TaskType.later;
  TimeOfDay? _scheduledTime;
  int? _durationMinutes;
  int? _selectedColorValue;

  bool get _isEditing => widget.existingTask != null;

  @override
  void initState() {
    super.initState();
    final task = widget.existingTask;
    _titleController = TextEditingController(text: task?.title ?? '');
    _memoController = TextEditingController(text: task?.memo ?? '');
    if (task != null) {
      _taskType = task.type;
      _scheduledTime = task.scheduledStart != null
          ? TimeOfDay.fromDateTime(task.scheduledStart!)
          : null;
      _durationMinutes = task.durationMinutes;
      _selectedColorValue = task.colorValue;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textHint,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              _isEditing ? 'タスクを編集' : 'タスクを追加',
              style: AppTypography.title,
            ),
            const SizedBox(height: 12),
            // Title input
            TextField(
              controller: _titleController,
              autofocus: !_isEditing,
              decoration: const InputDecoration(
                hintText: 'タスク名を入力',
              ),
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _save(),
            ),
            const SizedBox(height: 12),
            // Task type selector
            Row(
              children: [
                _TypeChip(
                  label: 'あとで',
                  icon: Icons.inbox_outlined,
                  selected: _taskType == TaskType.later,
                  onTap: () => setState(() {
                    _taskType = TaskType.later;
                    _scheduledTime = null;
                  }),
                ),
                const SizedBox(width: 8),
                _TypeChip(
                  label: '時間指定',
                  icon: Icons.schedule,
                  selected: _taskType == TaskType.scheduled,
                  onTap: () async {
                    setState(() => _taskType = TaskType.scheduled);
                    await _pickTime();
                  },
                ),
              ],
            ),
            // Scheduled time display
            if (_taskType == TaskType.scheduled && _scheduledTime != null) ...[
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickTime,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceVariant,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.access_time,
                          size: 16, color: AppColors.primary),
                      const SizedBox(width: 6),
                      Text(
                        _scheduledTime!.formatted,
                        style: AppTypography.body
                            .copyWith(color: AppColors.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            // Duration
            const SizedBox(height: 12),
            _DurationSelector(
              value: _durationMinutes,
              onChanged: (v) => setState(() => _durationMinutes = v),
            ),
            // Color
            const SizedBox(height: 12),
            _ColorSelector(
              selectedValue: _selectedColorValue,
              onChanged: (v) => setState(() => _selectedColorValue = v),
            ),
            const SizedBox(height: 16),
            // Actions
            Row(
              children: [
                if (_isEditing)
                  TextButton.icon(
                    onPressed: _delete,
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    label:
                        const Text('削除', style: TextStyle(color: Colors.red)),
                  ),
                const Spacer(),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('キャンセル'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _save,
                  child: Text(_isEditing ? '更新' : '追加'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _scheduledTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _scheduledTime = picked);
    }
  }

  void _save() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final repo = ref.read(taskRepositoryProvider);
    final date = ref.read(selectedDateProvider);

    DateTime? scheduledStart;
    if (_taskType == TaskType.scheduled && _scheduledTime != null) {
      scheduledStart = date.withTime(_scheduledTime!);
    }

    if (_isEditing) {
      // For now, delete and recreate (simplified update)
      repo.deleteTask(widget.existingTask!.id);
    }

    repo.createTask(
      title: title,
      type: _taskType,
      targetDate: date,
      scheduledStart: scheduledStart,
      durationMinutes: _durationMinutes,
      memo: _memoController.text.isEmpty ? null : _memoController.text,
      colorValue: _selectedColorValue,
    );

    Navigator.pop(context);
  }

  void _delete() {
    if (widget.existingTask == null) return;
    ref.read(taskRepositoryProvider).deleteTask(widget.existingTask!.id);
    Navigator.pop(context);
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _TypeChip({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 16, color: selected ? Colors.white : AppColors.textSecondary),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTypography.caption.copyWith(
                color: selected ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DurationSelector extends StatelessWidget {
  final int? value;
  final ValueChanged<int?> onChanged;

  const _DurationSelector({required this.value, required this.onChanged});

  static const _options = [15, 30, 45, 60, 90, 120];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('所要時間', style: AppTypography.caption),
        const SizedBox(height: 6),
        Wrap(
          spacing: 6,
          children: [
            _buildChip(null, 'なし'),
            ..._options.map((m) => _buildChip(m, _formatMinutes(m))),
          ],
        ),
      ],
    );
  }

  Widget _buildChip(int? minutes, String label) {
    final selected = value == minutes;
    return GestureDetector(
      onTap: () => onChanged(minutes),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          label,
          style: AppTypography.caption.copyWith(
            color: selected ? Colors.white : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  String _formatMinutes(int m) {
    if (m < 60) return '$m分';
    final h = m ~/ 60;
    final remainder = m % 60;
    if (remainder == 0) return '$h時間';
    return '$h時間$remainder分';
  }
}

class _ColorSelector extends StatelessWidget {
  final int? selectedValue;
  final ValueChanged<int?> onChanged;

  const _ColorSelector(
      {required this.selectedValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('カラー', style: AppTypography.caption),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          children: AppColors.taskColors.map((color) {
            final isSelected = selectedValue == color.toARGB32();
            return GestureDetector(
              onTap: () => onChanged(
                  isSelected ? null : color.toARGB32()),
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: AppColors.primary, width: 2.5)
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
