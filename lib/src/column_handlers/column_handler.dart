import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../types.dart';
import 'aggregate_column_handler.dart';

/// A class which handles a single [column].
abstract class ColumnHandler<T extends Object>
    extends AggregateColumnHandler<T> {
  /// Create an instance.
  ColumnHandler({
    required this.column,
    required super.value,
    this.title,
    this.onSetNull,
  });

  /// The column this handler references.
  final GeneratedColumn<T> column;

  /// The title which will be used to show [value].
  ///
  /// If [title] is `null`, then the name of the column will be converted to
  /// title case.
  final String? title;

  /// The function to call before [value] gets set to `null`.
  ///
  /// When [onSetNull] gets called, [value] retains its previous value, which
  /// may or may not be `null`.
  ///
  /// This is useful when [column] represents a foreign key, and you need to
  /// delete the other side of a one-to-one relationship.
  final Future<void> Function(GeneratedDatabase database)? onSetNull;

  /// Get the appropriate title.
  String getTitle() => title ?? column.name.titleCase;

  /// Get columns for inserting [newValue].
  @override
  Map<GeneratedColumn<Object>, Object?> getColumns(final Object newValue) =>
      {column: newValue};

  /// Get a suitable widget to display [value].
  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
