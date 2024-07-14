import 'package:flutter/material.dart';
import 'package:simple_mensa/data/database/object_box.dart';
import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/simple_mensa.dart';
import 'package:simple_mensa/util/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBox = await ObjectBox.create();
  final userSettings =
      await objectBox.store.box<UserSettings>().getAsync(Constants.userId);

  runApp(SimpleMensa(
    store: objectBox.store,
    useDarkTheme: userSettings?.useDarkTheme ?? false,
  ));
}
