import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:simple_mensa/util/constants.dart';

part 'canteen.g.dart';

@Entity()
@JsonSerializable()
class Canteen {
  const Canteen({
    required this.id,
    required this.address,
    required this.coordinates,
    required this.name,
    required this.url,
  });

  @Id(assignable: true)
  final int id;
  final String address;
  final List<double> coordinates;
  final String name;
  final String url;

  factory Canteen.fromJson(Map<String, dynamic> json) =>
      _$CanteenFromJson(json);

  Map<String, dynamic> toJson() => _$CanteenToJson(this);

  String getImageUrl() {
    const start = 'details-';
    const end = '.html';
    final startIndex = url.indexOf(start);
    final endIndex = url.indexOf(end, startIndex + start.length);
    final imageName = url.substring(startIndex + start.length, endIndex);
    return '${Constants.canteenImageUrl}$imageName.jpg';
  }
}
