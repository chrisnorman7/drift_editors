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

  /// Get the appropriate title.
  String getTitle() => title ?? column.name.titleCase;

  /// Get a suitable widget to display [value].
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
