import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/user_settings.dart';

@immutable
abstract class SettingsEvent {
  const SettingsEvent();
}

class SettingsLoadData extends SettingsEvent {
  const SettingsLoadData();
}

class SettingsSetInput extends SettingsEvent {
  const SettingsSetInput({required this.userSettings});

  final UserSettings userSettings;
}
