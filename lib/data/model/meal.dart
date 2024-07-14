import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  const Meal({
    required this.id,
    required this.name,
    required this.notes,
    required this.prices,
    required this.category,
    required this.image,
  });

  final int id;
  final String name;
  final List<String>? notes;
  final Map<String, double?> prices;
  final String? category;
  final String? image;

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

  bool get isVeggie {
    final note = notes?.firstWhereOrNull(
        (note) => note.contains('vegetarisch') || note.contains('vegan'));
    return note != null;
  }

  String formattedPrices() {
    final numberFormat = NumberFormat.currency(locale: 'de_De', symbol: '€');
    return prices.values.map((e) => numberFormat.format(e)).join('/');
  }
}
