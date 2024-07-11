import 'package:flutter/material.dart';
import 'package:simple_mensa/data/database/object_box.dart';
import 'package:simple_mensa/simple_mensa.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final objectBox = await ObjectBox.create();

  runApp(SimpleMensa(store: objectBox.store));
}
