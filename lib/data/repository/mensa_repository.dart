import 'dart:developer';

import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/service/mensa_client.dart';

class MensaRepository {
  const MensaRepository({required this.mensaClient});

  final MensaClient mensaClient;

  Future<List<Canteen>> getCanteens() async {
    try {
      return await mensaClient.getCanteens();
    } catch (e) {
      log(e.toString());
      return const <Canteen>[];
    }
  }
}
