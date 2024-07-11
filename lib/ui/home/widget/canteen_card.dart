import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_mensa/data/model/canteen.dart';

class CanteenCard extends StatelessWidget {
  const CanteenCard({super.key, required this.canteen});

  final Canteen canteen;

  @override
  Widget build(BuildContext context) {
    const size = 84.0;
    return Card(
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: canteen.getImageUrl(),
          width: size,
          height: size,
        ),
        title: Text(canteen.name),
        subtitle: Text(canteen.address),
      ),
    );
  }
}
