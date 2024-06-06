import 'package:flutter/material.dart';

import 'column_handlers/aggregate_column_handler.dart';
import 'screens/drift_editor_screen.dart';
import 'widgets/columns_list_view.dart';

/// A tab in a [DriftEditorScreen].
class DriftEditorTabbedScaffoldTab {
  /// Create an instance.
  const DriftEditorTabbedScaffoldTab({
    required this.title,
    required this.icon,
    required this.columnHandlers,
    this.actions,
    this.floatingActionButton,
    this.leading,
  });

  /// The title of this tab.
  final String title;

  /// The icon to show for this tab.
  final Widget icon;

  /// The columns to include.
  ///
  /// The [columnHandlers] will be passed directly to [ColumnsListView].
  final List<AggregateColumnHandler> columnHandlers;

  /// A list of action widgets for this tab.
  final List<Widget>? actions;

  /// The floating action button to use for this tab.
  final Widget? floatingActionButton;

  /// The leading widget for this tab.
  final Widget? leading;
}
