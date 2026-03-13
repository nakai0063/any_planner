import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  DateTime get startOfDay => DateTime(year, month, day);

  DateTime withTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);

  String get shortDateLabel {
    if (isToday) return '今日';
    if (isTomorrow) return '明日';
    if (isYesterday) return '昨日';
    return '$month/$day';
  }

  String get weekdayLabel {
    const days = ['月', '火', '水', '木', '金', '土', '日'];
    return days[weekday - 1];
  }
}

extension TimeOfDayExt on TimeOfDay {
  String get formatted =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  double get toDouble => hour + minute / 60.0;

  int get totalMinutes => hour * 60 + minute;
}
