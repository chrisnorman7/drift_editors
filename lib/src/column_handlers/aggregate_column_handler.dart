import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import '../types.dart';

/// A class which allows aggregating multiple columns into a single value.
abstract class AggregateColumnHandler<T extends Object> {
  /// Create an instance.
  AggregateColumnHandler({
    required this.value,
  });

  /// The current value to use.
  T? value;

  /// Convert a new [value] back to columns.
  Map<GeneratedColumn, Object?> getColumns(final T newValue);

  /// The function to call to get a suitable widget.
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<T?> onChanged,
  });
}
