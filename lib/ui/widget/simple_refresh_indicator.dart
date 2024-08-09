import 'package:flutter/material.dart';
import 'package:simple_mensa/ui/theme/simple_colors.dart';

class SimpleRefreshIndicator extends StatelessWidget {
  const SimpleRefreshIndicator(
      {super.key,
      required this.child,
      required this.onRefresh,
      this.color = SimpleColors.accentColor});

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
