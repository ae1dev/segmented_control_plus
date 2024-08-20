part of '../segmented_control_plus.dart';

class Segment<T> {
  /// Icon of the segment
  IconData icon;

  /// The value passed on onTap
  T value;

  /// Hover/longpress tooltip
  String? tooltip;

  Segment({
    required this.icon,
    required this.value,
    this.tooltip,
  });
}
