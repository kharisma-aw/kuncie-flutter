import 'package:flutter/material.dart';

class MeasuredSizeContainer extends StatefulWidget {
  const MeasuredSizeContainer({
    super.key,
    required this.child,
    required this.onSizeChanged,
  });

  final Widget child;

  final ValueChanged<Size> onSizeChanged;

  @override
  _MeasuredSizeContainerState createState() => _MeasuredSizeContainerState();
}

class _MeasuredSizeContainerState extends State<MeasuredSizeContainer> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());

    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());

        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: Container(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    final context = _widgetKey.currentContext;
    if (context == null) return;
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChanged(size!);
    }
  }
}
