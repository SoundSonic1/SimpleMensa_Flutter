import 'dart:developer';

import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/service/mensa_client.dart';
import 'package:simple_mensa/objectbox.g.dart';

class MensaRepository {
  const MensaRepository({required this.mensaClient, required this.canteenBox});

  final MensaClient mensaClient;
  final Box<Canteen> canteenBox;

  Future<List<Canteen>> getCanteens() async {
    try {
      final canteens = await mensaClient.getCanteens();
      canteenBox.putManyAsync(canteens);
      return canteens;
    } catch (e) {
      log(e.toString());
      return await canteenBox.getAllAsync();
    }
  }
}
