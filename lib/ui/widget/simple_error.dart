import 'package:flutter/material.dart';

class SimpleError extends StatelessWidget {
  const SimpleError({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
        message,
        style: const TextStyle(fontSize: 24),
      ));
  }
}
