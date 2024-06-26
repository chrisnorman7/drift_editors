import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../constants.dart';
import '../types.dart';
import 'aggregate_column_handler.dart';
import 'point_column_handler.dart';

/// A class which handles a single [column].
///
/// If you want to handle multiple columns, override [AggregateColumnHandler]
/// yourself. For an example, see [PointColumnHandler].
abstract class ColumnHandler<T extends Object>
    extends AggregateColumnHandler<T> {
  /// Create an instance.
  ColumnHandler({
    required this.column,
    required super.value,
    final String? title,
    super.onSetNull,
  }) : super(
          title: title ?? column.name.titleCase,
          isNullable: column.$nullable,
          defaultValue: getColumnDefault(column),
        );

  /// The column this handler references.
  final GeneratedColumn<T> column;

  /// Get columns for inserting [newValue].
  @override
  Map<GeneratedColumn<Object>, Object?> getColumns(final T? newValue) =>
      {column: newValue};

  /// Get a suitable widget to display [value].
  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
