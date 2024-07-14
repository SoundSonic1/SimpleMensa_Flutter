import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_mensa/data/model/meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) => Card(
        child: ExpansionTile(
          title: Text(meal.name),
          subtitle: Row(
            children: [
              if (meal.category != null) Text(meal.category!),
              const Spacer(),
              if (meal.isVeggie) ...[
                SvgPicture.asset(
                  'assets/carrot_icon.svg',
                  width: 20.0,
                ),
                const SizedBox(
                  width: 8.0,
                )
              ],
              Text(meal.formattedPrices()),
            ],
          ),
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
