// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'canteen.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Canteen _$CanteenFromJson(Map<String, dynamic> json) => Canteen(
      id: (json['id'] as num).toInt(),
      address: json['address'] as String,
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CanteenToJson(Canteen instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'coordinates': instance.coordinates,
      'name': instance.name,
      'url': instance.url,
    };
