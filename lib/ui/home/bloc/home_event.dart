import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';

@immutable
abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadData extends HomeEvent {
  const HomeLoadData();
}

class HomeOnReorder extends HomeEvent {
  const HomeOnReorder({
    required this.oldIndex,
    required this.newIndex,
    required this.canteens,
  });

  final int oldIndex;
  final int newIndex;
  final List<Canteen> canteens;
}

class HomeDismissedDialog extends HomeEvent {
  const HomeDismissedDialog({required this.version});

  final String version;
}