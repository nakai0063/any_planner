enum TaskType {
  later,
  scheduled,
  recurring;

  String get label {
    switch (this) {
      case TaskType.later:
        return 'あとで';
      case TaskType.scheduled:
        return '時間指定';
      case TaskType.recurring:
        return '繰り返し';
    }
  }
}
