import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

@immutable
abstract class CanteenState {
  const CanteenState();
}

class CanteenLoading extends CanteenState {
  const CanteenLoading();
}

class CanteenError extends CanteenState {
  const CanteenError();
}

class CanteenDataLoaded extends CanteenState {
  const CanteenDataLoaded({required this.meals, required this.userSettings});

  final List<Meal> meals;
  final UserSettings userSettings;
}
