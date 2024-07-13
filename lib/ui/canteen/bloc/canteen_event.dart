import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class CanteenEvent {}

class CanteenLoadData extends CanteenEvent {
  CanteenLoadData({required this.canteen, required this.dateTime});

  final Canteen canteen;
  final DateTime dateTime;
}
