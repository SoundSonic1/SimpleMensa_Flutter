import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:simple_mensa/data/model/canteen.dart';
import 'package:simple_mensa/data/model/meal.dart';
import 'package:simple_mensa/util/constants.dart';

part 'mensa_client.g.dart';

@RestApi(baseUrl: Constants.url)
abstract class MensaClient {
  factory MensaClient(Dio dio, {String baseUrl}) = _MensaClient;

  @GET('/canteens')
  Future<List<Canteen>> getCanteens();

  @GET('/canteens/{id}/days/{date}/meals')
  Future<List<Meal>> getMeals(@Path('id') String id, @Path('date') String date);
}
