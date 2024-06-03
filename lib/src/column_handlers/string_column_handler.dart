import 'package:backstreets_widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../types.dart';
import 'column_handler.dart';

/// A column handler for a [String] [value].
class StringColumnHandler extends ColumnHandler<String> {
  /// Create an instance.
  StringColumnHandler({
    required super.value,
    required super.column,
    super.title,
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
        header: getTitle(),
        autofocus: autofocus,
        validator: validator,
      );
}
