import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    this.overrides = const [],
    required this.child,
  });

  final List<Override> overrides;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: overrides,
      child: MaterialApp(
        home: child,
      ),
    );
  }
}
