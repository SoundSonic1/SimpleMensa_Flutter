import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:simple_mensa/data/model/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) => Card(
        child: ExpansionTile(
          title: Text(meal.name),
          subtitle: Text(meal.formattedPrices()),
          shape: const Border(),
          children: <Widget>[
            if (meal.image != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, bottom: 12.0),
                child: CachedNetworkImage(imageUrl: 'https:${meal.image}'),
              )
          ],
        ),
      );
}
