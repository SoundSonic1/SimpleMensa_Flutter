import 'package:flutter/cupertino.dart';

class SimpleError extends StatelessWidget {
  const SimpleError({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Something went wrong.',
      style: TextStyle(fontSize: 24),
    ));
  }
}
