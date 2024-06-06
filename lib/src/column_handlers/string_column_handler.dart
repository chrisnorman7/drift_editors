import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../types.dart';
import 'column_handler.dart';

/// A column handler for a [String] [value].
///
/// You can pass a [validator] to control what values are accepted.
class StringColumnHandler extends ColumnHandler<String> {
  /// Create an instance.
  StringColumnHandler({
    required super.value,
    required super.column,
    super.title,
    super.onSetNull,
    this.validator,
  });

  /// The validator to use with [getWidget].
  final FormFieldValidator<String>? validator;
  @override
  Widget getWidget({
    required final BuildContext context,
    required final bool autofocus,
    required final OnChanged<String?> onChanged,
  }) =>
      TextListTile(
        value: value ?? '',
        onChanged: onChanged,
        header: title,
        autofocus: autofocus,
        validator: validator,
      );
}
