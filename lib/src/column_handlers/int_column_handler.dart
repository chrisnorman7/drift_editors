import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'column_handler.dart';

/// A column handler for an [int] [value].
class IntColumnHandler extends ColumnHandler<int> {
  /// Create an instance.
  IntColumnHandler({
    required super.column,
    required super.value,
    this.min,
    this.max,
    this.modifier = 1,
    super.title,
  });

  /// The minimum value.
  final int? min;

  /// THe max possible value.
  final int? max;

  /// The modifier to use.
  final int modifier;

  /// Get the widget.
  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final Future<void> Function(int? newValue) onChanged,
  }) =>
      IntListTile(
        value: value ?? 0,
        onChanged: onChanged,
        title: getTitle(),
        autofocus: autofocus,
        min: min,
        max: max,
        modifier: modifier,
      );
}
