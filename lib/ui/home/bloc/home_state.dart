import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {}

class HomeDataLoaded extends HomeState {
  HomeDataLoaded({required this.canteens});

  final List<Canteen> canteens;
}
