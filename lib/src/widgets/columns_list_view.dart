import 'package:backstreets_widgets/widgets.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart' hide Row, Table;

import '../column_handlers/aggregate_column_handler.dart';
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
  final List<AggregateColumnHandler> columnHandlers;

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
          return RebuildableWidget(
            builder: (final builderContext, final rebuild) => CommonShortcuts(
              deleteCallback: () {
                final oldValue = handler.value;
                if ((handler.isNullable) && oldValue != null) {
                  _onChanged(handler, null, rebuild);
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

  /// Handle database changes.
  Future<void> _onChanged(
    final AggregateColumnHandler handler,
    final Object? newValue,
    final VoidCallback rebuild,
  ) async {
    await database.transaction(() async {
      if (newValue == null) {
        await handler.onSetNull?.call(database);
      }
      final query = database.update(tableInfo)
        ..where(
          (final table) => primaryKeyColumn.equals(primaryKey),
        );
      final map = handler.getColumns(newValue);
      await query.writeReturning(
        RawValuesInsertable({
          for (final MapEntry(key: column, value: value) in map.entries)
            column.name: Variable(value),
        }),
      );
    });
    handler.value = newValue;
    rebuild();
    onChanged?.call();
  }
}
