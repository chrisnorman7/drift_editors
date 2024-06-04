import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../types.dart';
import 'column_handler.dart';

/// A column handler for an [int] [value].
class IntColumnHandler extends ColumnHandler<int> {
  /// Create an instance.
  IntColumnHandler({
    required super.column,
    required super.value,
    super.title,
    this.subtitle,
    super.onSetNull,
    this.min,
    this.max,
    this.modifier = 1,
  });

  /// The subtitle for the [IntListTile].
  final String? subtitle;

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
    required final OnChanged<int?> onChanged,
  }) =>
      IntListTile(
        value: value ?? 0,
        onChanged: onChanged,
        title: title,
        subtitle: subtitle,
        autofocus: autofocus,
        min: min,
        max: max,
        modifier: modifier,
      );
}
