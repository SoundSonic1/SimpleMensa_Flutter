import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/objectbox.g.dart';
import 'package:simple_mensa/util/constants.dart';

class UserRepository {
  UserRepository({required this.settingsBox});

  final Box<UserSettings> settingsBox;

  Future<UserSettings> getUserSettings() async {
    return await settingsBox.getAsync(Constants.userId) ?? UserSettings();
  }

  Future<void> saveUserSettings(UserSettings settings) async {
    settingsBox.putAsync(settings);
  }
}
