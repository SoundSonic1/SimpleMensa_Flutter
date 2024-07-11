// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      notes:
          (json['notes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      prices: (json['prices'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num?)?.toDouble()),
      ),
      category: json['category'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notes': instance.notes,
      'prices': instance.prices,
      'category': instance.category,
      'image': instance.image,
    };
