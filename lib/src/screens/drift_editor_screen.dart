import 'package:backstreets_widgets/screens.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Row, Table;

import '../column_handlers/aggregate_column_handler.dart';
import '../widgets/columns_list_view.dart';

/// A screen to edit a row, given a suitable [tableInfo].
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
    this.actions = const [],
    this.floatingActionButton,
    this.leading,
    super.key,
  });

  /// The column handlers to use.
  final List<AggregateColumnHandler> columnHandlers;

  /// The title of the [SimpleScaffold].
  final String title;

  /// The database to use.
  final GeneratedDatabase database;

  /// The table to use.
  final TableInfo<T, R> tableInfo;

  /// The primary key column to use.
  ///
  /// This column is used when making updates to the database.
  final GeneratedColumn<int> primaryKeyColumn;

  /// The primary key of the row this widget will be working on.
  final int primaryKey;

  /// The function to call when the row has changed.
  ///
  /// The [onChanged] callback lets you invalidate providers, or update other
  /// parts of your UI.
  final VoidCallback? onChanged;

  /// The actions to show.
  final List<Widget> actions;

  /// The floating action button to use.
  final Widget? floatingActionButton;

  /// The leading widget to use.
  final Widget? leading;

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
        actions: actions,
        floatingActionButton: floatingActionButton,
        leading: leading,
      );
}
