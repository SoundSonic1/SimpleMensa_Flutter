import 'package:flutter/material.dart';
import 'package:simple_mensa/data/model/canteen.dart';

class CanteenCard extends StatelessWidget {
  const CanteenCard({super.key, required this.canteen});

  final Canteen canteen;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(canteen.name),
    );
  }
}
