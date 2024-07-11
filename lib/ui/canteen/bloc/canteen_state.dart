import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/meal.dart';

@immutable
abstract class CanteenState {}

class CanteenLoading extends CanteenState {}

class CanteenError extends CanteenState {}

class CanteenDataLoaded extends CanteenState {
  CanteenDataLoaded({required this.meals});

  final List<Meal> meals;
}
