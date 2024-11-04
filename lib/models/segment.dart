part of '../segmented_control_plus.dart';

class Segment<T> {
  /// The value passed on onTap
  T value;

  /// Hover/longpress tooltip
  String? tooltip;

  Segment({
    required this.value,
    this.tooltip,
  });
}

class SegmentIcon<T> extends Segment<T> {
  /// Icon of the segment
  IconData icon;

  SegmentIcon({
    required this.icon,
    required super.value,
    super.tooltip,
  });
}

class SegmentIconBuilder<T> extends Segment<T> {
  /// Icon of the segment
  Widget Function(BuildContext context, Color color) iconBuilder;

  SegmentIconBuilder({
    required this.iconBuilder,
    required super.value,
    super.tooltip,
  });
}