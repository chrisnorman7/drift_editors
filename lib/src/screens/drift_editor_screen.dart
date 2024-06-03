import 'package:backstreets_widgets/screens.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Row, Table;

import '../column_handlers/column_handler.dart';
import '../widgets/columns_list_view.dart';

/// A screen to edit any table.
class DriftEditorScreen<T extends Table, R extends DataClass>
    extends StatelessWidget {
  /// Create an instance.
  const DriftEditorScreen({
    required this.columnHandlers,
    required this.title,
    required this.database,
    required this.tableInfo,
    required this.primaryKeyColumn,
    required this.primaryKey,
    this.onChanged,
    super.key,
  });

  /// The column handlers to use.
  final List<ColumnHandler> columnHandlers;

  /// The title of the [SimpleScaffold].
  final String title;

  /// The database to use.
  final GeneratedDatabase database;

  /// The table to use.
  final TableInfo<T, R> tableInfo;

  /// The primary key column to use.
  final GeneratedColumn<int> primaryKeyColumn;

  /// The primary key of the row this widget will be working on.
  final int primaryKey;

  /// The function to call when the row has changed.
  final VoidCallback? onChanged;

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => SimpleScaffold(
        title: title,
        body: ColumnsListView(
          database: database,
          tableInfo: tableInfo,
          columnHandlers: columnHandlers,
          primaryKeyColumn: primaryKeyColumn,
          primaryKey: primaryKey,
          onChanged: onChanged,
        ),
      );
}
