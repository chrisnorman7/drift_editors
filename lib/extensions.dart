import 'package:drift/drift.dart';

/// Provides useful extension methods.
extension GeneratedDatabaseX on GeneratedDatabase {
  /// Find the primary key for a table.
  ///
  /// Code provided by Chat GPT.
  Future<GeneratedColumn?> findPrimaryKey(final TableInfo table) async {
    // Querying SQLite schema information
    final primaryKeyInfo = await customSelect(
      'PRAGMA table_info(${table.actualTableName})',
      readsFrom: {table},
    ).get();

    for (final row in primaryKeyInfo) {
      final columnName = row.data['name'] as String;
      final isPrimaryKey = row.data['pk'] as int;
      if (isPrimaryKey == 1) {
        return table.columnsByName[columnName];
      }
    }
    return null;
  }
}
