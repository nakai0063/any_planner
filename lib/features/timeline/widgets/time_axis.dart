import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';

class TimeAxis extends StatelessWidget {
  final int hour;
  final bool isHalfHour;

  const TimeAxis({
    super.key,
    required this.hour,
    this.isHalfHour = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          isHalfHour
              ? ''
              : '${hour.toString().padLeft(2, '0')}:00',
          style: AppTypography.timeLabel,
          textAlign: TextAlign.right,
        ),
      ),
    );
  }
}

class TimeSlot extends StatelessWidget {
  final int hour;
  final bool isHalfHour;
  final Widget? child;
  final bool isDropTarget;
  final ValueChanged<String>? onTaskDropped;

  const TimeSlot({
    super.key,
    required this.hour,
    this.isHalfHour = false,
    this.child,
    this.isDropTarget = false,
    this.onTaskDropped,
  });

  static const double slotHeight = 60.0;

  @override
  Widget build(BuildContext context) {
    return DragTarget<String>(
      onWillAcceptWithDetails: (_) => true,
      onAcceptWithDetails: (details) {
        onTaskDropped?.call(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        final isHovering = candidateData.isNotEmpty;
        return Container(
          height: slotHeight,
          decoration: BoxDecoration(
            color: isHovering
                ? AppColors.primary.withValues(alpha: 0.08)
                : Colors.transparent,
            border: Border(
              top: BorderSide(
                color: isHalfHour
                    ? AppColors.surfaceVariant
                    : AppColors.textHint.withValues(alpha: 0.2),
                width: isHalfHour ? 0.5 : 1,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TimeAxis(hour: hour, isHalfHour: isHalfHour),
              Expanded(child: child ?? const SizedBox.shrink()),
            ],
          ),
        );
      },
    );
  }
}
