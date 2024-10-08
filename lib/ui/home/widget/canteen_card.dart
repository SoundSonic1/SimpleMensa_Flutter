import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_mensa/data/model/canteen.dart';

class CanteenCard extends StatelessWidget {
  const CanteenCard({super.key, required this.canteen, required this.onTap});

  final Canteen canteen;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const size = 84.0;
    return Card(
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          leading: CachedNetworkImage(
            imageUrl: canteen.getImageUrl(),
            width: size,
            height: size,
          ),
          title: Text(
            canteen.name,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          subtitle: Text(canteen.address),
          trailing: const Icon(Icons.drag_handle),
        ),
      ),
    );
  }
}
