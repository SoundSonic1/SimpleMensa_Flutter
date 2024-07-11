import 'package:flutter/material.dart';

class SimpleProgressIndicator extends StatelessWidget {
  const SimpleProgressIndicator({super.key, this.size = 48.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
