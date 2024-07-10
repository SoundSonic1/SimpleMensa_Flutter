import 'package:flutter/cupertino.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class HomeEvent {}

class HomeLoadData extends HomeEvent {}

class HomeCanteenClicked extends HomeEvent {
  HomeCanteenClicked({required this.canteen});

  final Canteen canteen;
}
