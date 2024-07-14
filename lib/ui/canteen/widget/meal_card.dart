import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, required this.userSettings});

  final Meal meal;
  final UserSettings userSettings;

  @override
  Widget build(BuildContext context) => Card(
        child: Container(
          color:
              userSettings.highlightVegan && meal.isVegan ? Colors.green : null,
          child: ExpansionTile(
            title: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Text(
                meal.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (meal.category != null)
                  Flexible(
                    child: Text(
                      meal.category!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                  ),
                Row(
                  children: [
                    if (meal.isVegan && userSettings.highlightVegan) ...[
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
              ],
            ),
            shape: const Border(),
            children: <Widget>[
              if (meal.image != null)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, bottom: 12.0),
                  child: CachedNetworkImage(imageUrl: 'https:${meal.image}'),
                ),
              if (meal.notes?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      for (final note in meal.notes!)
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('• $note'))
                    ],
                  ),
                ),
              const SizedBox(
                height: 8.0,
              )
            ],
          ),
        ),
      );
}
