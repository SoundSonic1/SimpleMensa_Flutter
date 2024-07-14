import 'package:flutter/foundation.dart';

@immutable
abstract class ThemeState {
  const ThemeState();
}

class ThemeLoaded extends ThemeState {
  const ThemeLoaded({required this.useDarkTheme});

  final bool useDarkTheme;
}
