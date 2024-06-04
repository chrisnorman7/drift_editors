import 'package:flutter/material.dart';

/// A widget that can be quickly rebuilt.
class RebuildableWidget extends StatefulWidget {
  /// Create an instance.
  const RebuildableWidget({
    required this.builder,
    super.key,
  });

  /// The function to call to rebuild this widget.
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
