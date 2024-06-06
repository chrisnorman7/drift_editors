import 'dart:math';

import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../../drift_editors.dart';

/// A column handler to handle a [Point] [value].
///
/// Instances use the [xColumn] and [yColumn] columns to build new [value]s.
class PointColumnHandler extends AggregateColumnHandler<Point<int>> {
  /// Create an instance.
  PointColumnHandler({
    required this.xColumn,
    required this.yColumn,
    required super.value,
    required super.title,
    final bool? isNullable,
    super.defaultValue,
    this.defaultModifier = 1,
    this.editorTitle = 'Point',
    this.minValue,
    this.maxValue,
  }) : super(isNullable: isNullable ?? xColumn.$nullable || yColumn.$nullable);

  /// The x column.
  final GeneratedColumn<int> xColumn;

  /// The y column to use.
  final GeneratedColumn<int> yColumn;

  /// The default modifier to use.
  final int defaultModifier;

  /// The title of the editor.
  final String editorTitle;

  /// The minimum point value.
  final Point<int>? minValue;

  /// The maximum point value.
  final Point<int>? maxValue;

  /// Convert [value] to columns.
  @override
  Map<GeneratedColumn<Object>, Object?> getColumns(
    final Point<int>? newValue,
  ) =>
      {xColumn: newValue?.x, yColumn: newValue?.y};

  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<Point<int>?> onChanged,
  }) =>
      PointListTile(
        point: value ?? const Point(0, 0),
        onChanged: onChanged,
        title: title,
        autofocus: autofocus,
        defaultModifier: defaultModifier,
        editorTitle: editorTitle,
        minValue: minValue,
        maxValue: maxValue,
      );
}
