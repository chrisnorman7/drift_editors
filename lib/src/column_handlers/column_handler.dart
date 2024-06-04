import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../types.dart';

/// A class which handles a single [column].
abstract class ColumnHandler<T extends Object> {
  /// Create an instance.
  ColumnHandler({
    required this.column,
    required this.value,
    this.title,
    this.onSetNull,
  });

  /// The column this handler references.
  final GeneratedColumn<T> column;

  /// The value of this column for the current row.
  T? value;

  /// The title which will be used to show [value].
  ///
  /// If [title] is `null`, then the name of the column will be converted to
  /// title case.
  final String? title;

  /// The function to call before [value] gets set to `null`.
  ///
  /// When [onSetNull] gets called, [value] is guaranteed to be in a non-null
  /// state.
  ///
  /// This is useful when [column] represents a foreign key, and you need to
  /// delete the other side of a one-to-one relationship.
  final Future<void> Function(GeneratedDatabase database)? onSetNull;

  /// Get the appropriate title.
  String getTitle() => title ?? column.name.titleCase;

  /// Get a suitable widget to display [value].
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
