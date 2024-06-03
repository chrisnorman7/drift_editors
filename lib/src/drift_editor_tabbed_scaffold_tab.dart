import 'package:flutter/material.dart';

import 'column_handlers/column_handler.dart';
import 'screens/drift_editor_screen.dart';

/// A tab in a [DriftEditorScreen].
class DriftEditorTabbedScaffoldTab {
  /// Create an instance.
  const DriftEditorTabbedScaffoldTab({
    required this.title,
    required this.icon,
    required this.columnHandlers,
  });

  /// The title of this tab.
  final String title;

  /// The icon to show for this tab.
  final Widget icon;

  /// The columns to include.
  final List<ColumnHandler> columnHandlers;
}
