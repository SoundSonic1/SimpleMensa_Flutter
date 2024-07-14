import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

@immutable
abstract class SettingsEvent {}

class SettingsLoadData extends SettingsEvent {}

class SettingsSetInput extends SettingsEvent {
  SettingsSetInput({required this.userSettings});

  final UserSettings userSettings;
}
