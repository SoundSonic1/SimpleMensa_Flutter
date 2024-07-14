import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

@immutable
abstract class SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsDataLoaded extends SettingsState {
  SettingsDataLoaded({required this.userSettings});

  final UserSettings userSettings;
}
