import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class CanteenEvent {
  const CanteenEvent();
}

class CanteenLoadData extends CanteenEvent {
  const CanteenLoadData({required this.canteen, required this.dateTime});

  final Canteen canteen;
  final DateTime dateTime;
}
