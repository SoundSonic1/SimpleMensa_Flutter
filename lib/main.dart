import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:simple_mensa/data/database/object_box.dart';
import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/data/model/version_info.dart';
import 'package:simple_mensa/simple_mensa.dart';
import 'package:simple_mensa/util/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBox = await ObjectBox.create();
  final userSettings =
      await objectBox.store.box<UserSettings>().getAsync(Constants.userId);

  VersionInfo.packageInfo = await PackageInfo.fromPlatform();

  runApp(SimpleMensa(
    store: objectBox.store,
    useDarkTheme: userSettings?.useDarkTheme ?? false,
    showInitialDialog: VersionInfo.packageInfo.version != userSettings?.version,
  ));
}
