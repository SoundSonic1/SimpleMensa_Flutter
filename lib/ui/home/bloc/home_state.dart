import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeError extends HomeState {
  const HomeError();
}

class HomeDataLoaded extends HomeState {
  const HomeDataLoaded(
      {required this.canteens, required this.showInitialDialog});

  final List<Canteen> canteens;
  final bool showInitialDialog;
}
