import 'package:drift/drift.dart';

/// An object which signifies there is no default value for a column.
const noDefaultValue = Object();

/// Try and get a default value from [column].
///
/// If [column] has no default value, then [noDefaultValue] will be returned.
Object? getColumnDefault(final GeneratedColumn column) {
  final clientDefault = column.clientDefault;
  if (clientDefault != null) {
    return clientDefault();
  }
  final defaultValue = column.defaultValue;
  if (defaultValue is Constant) {
    return defaultValue.value;
  }
  // This will *not* be an exhaustive list.
  if (defaultValue == currentDateAndTime) {
    return DateTime.now();
  }
  return noDefaultValue;
}
