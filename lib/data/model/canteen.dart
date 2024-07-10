import 'package:json_annotation/json_annotation.dart';

part 'canteen.g.dart';

@JsonSerializable()
class Canteen {
  const Canteen({required this.id, required this.name, required this.url});

  final int id;
  final String name;
  final String url;

  factory Canteen.fromJson(Map<String, dynamic> json) =>
      _$CanteenFromJson(json);

  Map<String, dynamic> toJson() => _$CanteenToJson(this);
}
