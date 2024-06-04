import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../types.dart';
import 'column_handler.dart';

/// A column handler for a [double] [value].
class DoubleColumnHandler extends ColumnHandler<double> {
  /// Create an instance.
  DoubleColumnHandler({
    required super.column,
    required super.value,
    super.title,
    this.subtitle,
    super.onSetNull,
    this.decimalPlaces = 2,
    this.min,
    this.max,
    this.modifier = 1.0,
  });

  /// The subtitle for the [DoubleListTile].
  final String? subtitle;

  /// The number of decimal places to use.
  final int decimalPlaces;

  /// The minimum value.
  final double? min;

  /// The maximum value.
  final double? max;

  /// The modifier to use.
  final double modifier;

  /// Get the widget.
  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<double?> onChanged,
  }) =>
      DoubleListTile(
        value: value ?? 0.0,
        onChanged: onChanged,
        title: getTitle(),
        subtitle: subtitle,
        autofocus: autofocus,
        decimalPlaces: decimalPlaces,
        min: min,
        max: max,
        modifier: modifier,
      );
}
