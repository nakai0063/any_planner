import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CurrentTimeIndicator extends StatefulWidget {
  final int startHour;
  final double slotHeight;

  const CurrentTimeIndicator({
    super.key,
    required this.startHour,
    this.slotHeight = 60.0,
  });

  @override
  State<CurrentTimeIndicator> createState() => _CurrentTimeIndicatorState();
}

class _CurrentTimeIndicatorState extends State<CurrentTimeIndicator> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final minutesSinceStart =
        (now.hour - widget.startHour) * 60 + now.minute;
    if (minutesSinceStart < 0) return const SizedBox.shrink();

    final topOffset = minutesSinceStart * widget.slotHeight / 30;

    return Positioned(
      top: topOffset,
      left: 0,
      right: 0,
      child: Row(
        children: [
          const SizedBox(width: 44),
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: AppColors.currentTimeLine,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Container(
              height: 2,
              color: AppColors.currentTimeLine,
            ),
          ),
        ],
      ),
    );
  }
}
