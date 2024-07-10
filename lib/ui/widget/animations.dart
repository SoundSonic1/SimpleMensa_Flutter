import 'package:flutter/material.dart';

class Animations {
  Animations._();

  static Widget progressIndicator() {
    const double size = 48;
    return const Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
