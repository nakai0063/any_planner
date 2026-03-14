import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/extensions/datetime_ext.dart';
import '../../core/providers.dart';
import '../../core/theme/app_typography.dart';
import '../../domain/models/task.dart' as domain;
import '../../domain/models/task_status.dart';
import '../later_list/later_list_sheet.dart';
import '../task_editor/task_editor_screen.dart';
import 'providers.dart';
import 'widgets/current_time_indicator.dart';
import 'widgets/task_card.dart';
import 'widgets/time_axis.dart';

class TimelineScreen extends ConsumerStatefulWidget {
  const TimelineScreen({super.key});

  @override
  ConsumerState<TimelineScreen> createState() => _TimelineScreenState();
}

class _TimelineScreenState extends ConsumerState<TimelineScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentTime();
    });
  }

  void _scrollToCurrentTime() {
    if (!_scrollController.hasClients) return;
    final settings = ref.read(settingsProvider).valueOrNull;
    final startHour = settings?.wakeTime.hour ?? 7;
    final now = DateTime.now();
    final minutesSinceStart = (now.hour - startHour) * 60 + now.minute;
    if (minutesSinceStart > 0) {
      final offset = (minutesSinceStart / 30) * TimeSlot.slotHeight - 100;
      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);
    final scheduledAsync = ref.watch(scheduledTasksProvider);
    final settings = ref.watch(settingsProvider);

    final startHour = settings.valueOrNull?.wakeTime.hour ?? 7;
    final endHour = settings.valueOrNull?.sleepTime.hour ?? 23;

    return Scaffold(
      appBar: AppBar(
        title: _DateSelector(
          date: selectedDate,
          onPrevious: () => _changeDate(-1),
          onNext: () => _changeDate(1),
          onTapDate: () => _pickDate(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.today),
            onPressed: _goToToday,
            tooltip: '今日',
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => _openSettings(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          scheduledAsync.when(
            data: (tasks) => _buildTimeline(tasks, startHour, endHour),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('エラー: $e')),
          ),
          if (selectedDate.isToday)
            CurrentTimeIndicator(
              startHour: startHour,
              slotHeight: TimeSlot.slotHeight,
            ),
        ],
      ),
      bottomSheet: const LaterListSheet(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: () => _addTask(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildTimeline(
      List<domain.Task> tasks, int startHour, int endHour) {
    final slots = <Widget>[];

    for (var h = startHour; h < endHour; h++) {
      for (var half = 0; half < 2; half++) {
        final isHalf = half == 1;
        final slotMinute = half * 30;
        final slotTime = DateTime(
          ref.read(selectedDateProvider).year,
          ref.read(selectedDateProvider).month,
          ref.read(selectedDateProvider).day,
          h,
          slotMinute,
        );

        // Find tasks that start in this slot
        final slotTasks = tasks.where((t) {
          if (t.scheduledStart == null) return false;
          final start = t.scheduledStart!;
          return start.hour == h &&
              ((start.minute >= slotMinute) &&
                  (start.minute < slotMinute + 30));
        }).toList();

        slots.add(
          TimeSlot(
            hour: h,
            isHalfHour: isHalf,
            onTaskDropped: (taskId) => _onTaskDroppedOnSlot(taskId, slotTime),
            child: slotTasks.isEmpty
                ? null
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: slotTasks
                        .map((t) => TaskCard(
                              task: t,
                              onTap: () => _editTask(context, t),
                              onDone: () => _toggleDone(t),
                            ))
                        .toList(),
                  ),
          ),
        );
      }
    }

    return ListView(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 160),
      children: slots,
    );
  }

  void _changeDate(int days) {
    ref.read(selectedDateProvider.notifier).state =
        ref.read(selectedDateProvider).add(Duration(days: days));
  }

  void _goToToday() {
    final now = DateTime.now();
    ref.read(selectedDateProvider.notifier).state =
        DateTime(now.year, now.month, now.day);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentTime();
    });
  }

  Future<void> _pickDate(BuildContext context) async {
    final current = ref.read(selectedDateProvider);
    final picked = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      ref.read(selectedDateProvider.notifier).state = picked;
    }
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const TaskEditorScreen(),
    );
  }

  void _editTask(BuildContext context, domain.Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => TaskEditorScreen(existingTask: task),
    );
  }

  void _toggleDone(domain.Task task) {
    final repo = ref.read(taskRepositoryProvider);
    if (task.status == TaskStatus.done) {
      repo.updateTaskStatus(task.id, TaskStatus.pending);
    } else {
      repo.updateTaskStatus(task.id, TaskStatus.done);
    }
  }

  void _onTaskDroppedOnSlot(String taskId, DateTime slotTime) {
    final repo = ref.read(taskRepositoryProvider);
    repo.scheduleTask(taskId, slotTime);
  }

  void _openSettings(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const _SettingsPlaceholder(),
      ),
    );
  }
}

class _DateSelector extends StatelessWidget {
  final DateTime date;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onTapDate;

  const _DateSelector({
    required this.date,
    required this.onPrevious,
    required this.onNext,
    required this.onTapDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left, size: 20),
          onPressed: onPrevious,
          visualDensity: VisualDensity.compact,
        ),
        GestureDetector(
          onTap: onTapDate,
          child: Text(
            '${date.month}/${date.day}（${date.weekdayLabel}） ${date.shortDateLabel}',
            style: AppTypography.title,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right, size: 20),
          onPressed: onNext,
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class _SettingsPlaceholder extends StatelessWidget {
  const _SettingsPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: const Center(child: Text('設定画面（Phase 2で実装）')),
    );
  }
}
