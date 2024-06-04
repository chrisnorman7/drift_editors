import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../types.dart';

/// A class which allows aggregating multiple columns into a single value.
abstract class AggregateColumnHandler<T extends Object> {
  /// Create an instance.
  AggregateColumnHandler({
    required this.value,
    required this.isNullable,
    required this.title,
    this.onSetNull,
    this.defaultValue = noDefaultValue,
  });

  /// The current value to use.
  T? value;

  /// Whether [value] is nullable.
  final bool isNullable;

  /// The default value to use.
  ///
  /// If [defaultValue] is [noDefaultValue], it will not be possible to set
  /// [value] to the default with the keyboard.
  final Object? defaultValue;

  /// The title which will be used to show [value].
  ///
  /// If [title] is `null`, then the name of the column will be converted to
  /// title case.
  final String title;

  /// The function to call before [value] gets set to `null`.
  ///
  /// When [onSetNull] gets called, [value] retains its previous value, which
  /// may or may not be `null`.
  ///
  /// This is useful when a column or columns represent a foreign key, and you
  /// need to delete the other side of a one-to-one relationship.
  final Future<void> Function(GeneratedDatabase database)? onSetNull;

  /// Convert a new [value] back to columns.
  Map<GeneratedColumn, Object?> getColumns(final T? newValue);

  /// The function to call to get a suitable widget.
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
