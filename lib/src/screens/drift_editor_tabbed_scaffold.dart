import 'package:backstreets_widgets/screens.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Row, Table;

import '../drift_editor_tabbed_scaffold_tab.dart';
import '../widgets/columns_list_view.dart';

/// A tabbed drift editor.
class DriftEditorTabbedScaffold<T extends Table, R extends DataClass>
    extends StatelessWidget {
  /// Create an instance.
  const DriftEditorTabbedScaffold({
    required this.tabs,
    required this.database,
    required this.tableInfo,
    required this.primaryKeyColumn,
    required this.primaryKey,
    this.onChanged,
    this.leadingTabs = const [],
    this.trailingTabs = const [],
    super.key,
  });

  /// The tabs to render.
  final List<DriftEditorTabbedScaffoldTab> tabs;

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

  /// A list of tabs to show before the rendered ones.
  final List<TabbedScaffoldTab> leadingTabs;

  /// A list of tabs to show after the rendered tabs.
  final List<TabbedScaffoldTab> trailingTabs;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => TabbedScaffold(
        tabs: [
          ...leadingTabs,
          ...tabs.map(
            (final tab) => TabbedScaffoldTab(
              title: tab.title,
              icon: tab.icon,
              builder: (final context) => ColumnsListView(
                database: database,
                tableInfo: tableInfo,
                columnHandlers: tab.columnHandlers,
                primaryKeyColumn: primaryKeyColumn,
                primaryKey: primaryKey,
                onChanged: onChanged,
              ),
            ),
          ),
          ...trailingTabs,
        ],
      );
}
