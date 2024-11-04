library segmented_control_plus;

import 'package:flutter/material.dart';

part 'models/segment.dart';

/// Segmented control
class SegmentedControl<T> extends StatelessWidget {
  /// Radius of the segmented control button
  final double borderRadius;

  /// Called with a segment has been tapped
  final Function(T value) onTap;

  /// List of segment options to choose
  final List<Segment> segments;

  /// Selected segment value [Optional]
  final T? selectedValue;

  /// Selected color [Optional]
  final Color? selectedColor;

  /// Background color of the control
  final Color? backgroundColor;

  const SegmentedControl({
    super.key,
    required this.segments,
    required this.onTap,
    this.borderRadius = 10,
    this.backgroundColor,
    this.selectedColor,
    this.selectedValue,
  }) : assert(segments.length != 0, 'Segments must not be empty');

  BorderRadius? _getBorderRadius(int index) {
    //First segment
    if (index == 0) {
      return BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        bottomLeft: Radius.circular(borderRadius),
      );
    }
    //Last segment
    if ((index + 1) == segments.length) {
      return BorderRadius.only(
        topRight: Radius.circular(borderRadius),
        bottomRight: Radius.circular(borderRadius),
      );
    }
    return null;
  }

  bool _isBorder(int index) {
    if (index == 0 || (index + 1) == segments.length) return true;
    return false;
  }

  Color _segmentBackgroundColor(T value, BuildContext context) {
    //Selected color
    if (selectedValue == value) {
      return selectedColor ?? Theme.of(context).primaryColor;
    }
    //Non selected color
    return backgroundColor ?? Theme.of(context).cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      color: backgroundColor ?? Theme.of(context).cardColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Row(
          children: List.generate(
            segments.length,
            (int index) {
              Color segmentColor =
                  _segmentBackgroundColor(segments[index].value, context);
              return InkWell(
                onTap: () => onTap(segments[index].value),
                borderRadius: _getBorderRadius(index),
                child: Tooltip(
                  message: segments[index].tooltip,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    decoration: BoxDecoration(
                      color: segmentColor,
                      borderRadius: _getBorderRadius(index),
                      border: !_isBorder(index)
                          ? Border.symmetric(
                              vertical: BorderSide(
                                color: Theme.of(context).dividerColor,
                              ),
                            )
                          : null,
                    ),
                    child:
                        _buildIconWidget(segments[index], segmentColor, context),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Builds the icon widget for the segment
  Widget _buildIconWidget(
      Segment segment, Color segmentColor, BuildContext context) {
    // Icon builder
    if (segment is SegmentIconBuilder) {
      return segment.iconBuilder(context, segmentColor);
    }

    // Icon
    return Icon(
      (segment as SegmentIcon).icon,
      size: 22,
      color:
          ThemeData.estimateBrightnessForColor(segmentColor) == Brightness.light
              ? Colors.black
              : Colors.white,
    );
  }
}
