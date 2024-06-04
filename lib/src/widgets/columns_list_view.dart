import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Row, Table;

import '../column_handlers/column_handler.dart';
import 'rebuildable_widget.dart';

/// A list view to show some columns.
class ColumnsListView<T extends Table, R extends DataClass>
    extends StatelessWidget {
  /// Create an instance.
  const ColumnsListView({
    required this.database,
    required this.tableInfo,
    required this.primaryKeyColumn,
    required this.primaryKey,
    required this.columnHandlers,
    this.onChanged,
    super.key,
  });

  /// The database to use.
  final GeneratedDatabase database;

  /// The table to use.
  final TableInfo<T, R> tableInfo;

  /// The columns to show.
  final List<ColumnHandler> columnHandlers;

  /// The primary key column to use.
  final GeneratedColumn<int> primaryKeyColumn;

  /// The primary key of the row this widget will be working on.
  final int primaryKey;

  /// The function to call when the row has changed.
  final VoidCallback? onChanged;

  /// Build the widget.
  @override
  Widget build(final BuildContext context) => ListView.builder(
        itemBuilder: (final _, final index) {
          final handler = columnHandlers[index];
          final column = handler.column;
          return RebuildableWidget(
            builder: (final builderContext, final rebuild) => CommonShortcuts(
              deleteCallback: () {
                final oldValue = handler.value;
                if (column.$nullable && oldValue != null) {
                  _onChanged(handler, null, rebuild);
                  handler.onSetNull?.call(oldValue);
                }
              },
              child: handler.getWidget(
                context: builderContext,
                autofocus: index == 0,
                onChanged: (final newValue) =>
                    _onChanged(handler, newValue, rebuild),
              ),
            ),
          );
        },
        itemCount: columnHandlers.length,
      );

  /// The on changed function to use.
  Future<void> _onChanged(
    final ColumnHandler handler,
    final Object? newValue,
    final VoidCallback rebuild,
  ) async {
    final query = database.update(tableInfo)
      ..where(
        (final table) => primaryKeyColumn.equals(primaryKey),
      );
    await query.writeReturning(
      RawValuesInsertable(
        {handler.column.name: Variable(newValue)},
      ),
    );
    handler.value = newValue;
    rebuild();
    onChanged?.call();
  }
}
