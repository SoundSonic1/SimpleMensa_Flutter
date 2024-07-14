import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadData extends HomeEvent {}

class HomeOnReorder extends HomeEvent {
  HomeOnReorder({
    required this.oldIndex,
    required this.newIndex,
    required this.canteens,
  });

  final int oldIndex;
  final int newIndex;
  final List<Canteen> canteens;
}