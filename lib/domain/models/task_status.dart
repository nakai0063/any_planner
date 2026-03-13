enum TaskStatus {
  pending,
  done,
  snoozed,
  skipped;

  String get label {
    switch (this) {
      case TaskStatus.pending:
        return '未完了';
      case TaskStatus.done:
        return '完了';
      case TaskStatus.snoozed:
        return 'スヌーズ';
      case TaskStatus.skipped:
        return 'スキップ';
    }
  }
}
