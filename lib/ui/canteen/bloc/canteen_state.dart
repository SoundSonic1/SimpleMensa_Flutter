import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

@immutable
abstract class CanteenState {}

class CanteenLoading extends CanteenState {}

class CanteenError extends CanteenState {}

class CanteenDataLoaded extends CanteenState {
  CanteenDataLoaded({required this.meals, required this.userSettings});

  final List<Meal> meals;
  final UserSettings userSettings;
}
