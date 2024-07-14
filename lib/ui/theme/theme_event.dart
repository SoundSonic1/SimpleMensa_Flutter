import 'package:flutter/foundation.dart';

@immutable
abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeSet extends ThemeEvent {
  const ThemeSet({required this.useDarkTheme});

  final bool useDarkTheme;
}
