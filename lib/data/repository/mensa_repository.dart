import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/data/model/user_settings.dart';
import 'package:simple_mensa/data/service/mensa_client.dart';
import 'package:simple_mensa/objectbox.g.dart';
import 'package:simple_mensa/util/constants.dart';

class MensaRepository {
  const MensaRepository({
    required this.mensaClient,
    required this.canteenBox,
    required this.settingsBox,
  });

  final MensaClient mensaClient;
  final Box<Canteen> canteenBox;
  final Box<UserSettings> settingsBox;

  Future<List<Canteen>> getCanteens() async {
    try {
      final canteens = await mensaClient.getCanteens();
      final settings = await settingsBox.getAsync(Constants.userId);
      final canteenOrderList = settings?.canteenOrder ?? [];
      await canteenBox.removeAllAsync();
      canteenBox.putManyAsync(canteens);

      if (canteenOrderList.length == canteens.length) {
        final sortedCanteens = _sortCanteensById(canteenOrderList, canteens);
        if (sortedCanteens.isNotEmpty) {
          return sortedCanteens;
        }
      }

      return canteens;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return await canteenBox.getAllAsync();
    }
  }

  Future<List<Meal>> getMeals(String id, String date) async {
    try {
      return await mensaClient.getMeals(id, date);
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
      return const [];
    }
  }

  Future<void> saveCanteenOrder(List<Canteen> canteens) async {
    final userSettings =
        await settingsBox.getAsync(Constants.userId) ?? UserSettings();

    await settingsBox.putAsync(userSettings.copyWith(
        canteenOrder: canteens.map((e) => e.id).toList()));
  }

  List<Canteen> _sortCanteensById(List<int> ids, List<Canteen> canteens) {
    try {
      final sortedCanteens =
          ids.map((id) => canteens.firstWhere((e) => id == e.id)).toList();
      return sortedCanteens;
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }
    }
    return const [];
  }
}
