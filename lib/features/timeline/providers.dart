import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers.dart';
import '../../domain/models/task.dart';
import '../../domain/models/user_settings.dart';

final scheduledTasksProvider = StreamProvider<List<Task>>((ref) {
  final repo = ref.watch(taskRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  return repo.watchScheduledTasks(date);
});

final laterTasksProvider = StreamProvider<List<Task>>((ref) {
  final repo = ref.watch(taskRepositoryProvider);
  final date = ref.watch(selectedDateProvider);
  return repo.watchLaterTasks(date);
});

final settingsProvider = StreamProvider<UserSettings>((ref) {
  final repo = ref.watch(settingsRepositoryProvider);
  return repo.watchSettings();
});
