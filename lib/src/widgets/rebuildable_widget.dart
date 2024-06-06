import 'package:flutter/material.dart';

import 'columns_list_view.dart';

/// A widget that can be quickly rebuilt.
///
/// This widget is used so only select columns can be redrawn in
/// [ColumnsListView].
class RebuildableWidget extends StatefulWidget {
  /// Create an instance.
  const RebuildableWidget({
    required this.builder,
    super.key,
  });

  /// The function to call to build this widget.
  ///
  /// The `rebuild` function which is passed to the builder can be used to call
  /// `setState` for this widget.
  final Widget Function(BuildContext builderContext, VoidCallback rebuild)
      builder;

  /// Create state for this widget.
  @override
  RebuildableWidgetState createState() => RebuildableWidgetState();
}

/// State for [RebuildableWidget].
class RebuildableWidgetState extends State<RebuildableWidget> {
  /// Build a widget.
  @override
  Widget build(final BuildContext context) => widget.builder(
        context,
        () {
          if (mounted) {
            setState(() {});
          }
        },
      );
}
