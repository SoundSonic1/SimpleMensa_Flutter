import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/objectbox.g.dart';
import 'package:simple_mensa/util/constants.dart';

class UserRepository {
  UserRepository({required this.settingsBox, required this.showInitialDialog});

  final Box<UserSettings> settingsBox;
  bool showInitialDialog;

  Future<UserSettings> getUserSettings() async {
    return await settingsBox.getAsync(Constants.userId) ?? UserSettings();
  }

  Future<void> saveUserSettings(UserSettings settings) async {
    await settingsBox.putAsync(settings);
  }
}
