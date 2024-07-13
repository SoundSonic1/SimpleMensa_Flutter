import 'package:flutter/material.dart';

class SimpleRefreshIndicator extends StatelessWidget {
  const SimpleRefreshIndicator(
      {super.key,
      required this.child,
      required this.onRefresh,
      this.color = Colors.purpleAccent});

  final Widget child;
  final Color color;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) => RefreshIndicator(
        onRefresh: onRefresh,
        color: color,
        child: child,
      );
}
