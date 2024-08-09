import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/ui/theme/simple_colors.dart';
import 'package:widget_zoom/widget_zoom.dart';

class MealCard extends StatelessWidget {
  const MealCard({super.key, required this.meal, required this.userSettings});

  final Meal meal;
  final UserSettings userSettings;

  @override
  Widget build(BuildContext context) => Card(
        color:
            userSettings.highlightVegan && meal.isVegan
            ? (userSettings.useDarkTheme
                ? SimpleColors.greenDark
                : SimpleColors.greenLight)
            : null,
        child: ExpansionTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              meal.name,
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
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
              Row(
                children: [
                  if (meal.isVegan && userSettings.highlightVegan) ...[
                    SvgPicture.asset(
                      'assets/carrot_icon.svg',
                      width: 20.0,
                      colorFilter: userSettings.useDarkTheme
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : null,
                    ),
                    const SizedBox(
                      width: 8.0,
                    )
                  ],
                  Text(
                    meal.formattedPrices(userSettings.showOnlyStudentPrices),
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          shape: const Border(),
          children: <Widget>[
            if (meal.image != null)
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, left: 12.0, right: 12.0, bottom: 12.0),
                child: WidgetZoom(
                    heroAnimationTag: meal.id,
                    zoomWidget:
                        CachedNetworkImage(imageUrl: 'https:${meal.image}')),
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
      );
}
