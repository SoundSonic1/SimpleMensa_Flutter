import 'package:objectbox/objectbox.dart';
import 'package:simple_mensa/util/constants.dart';

@Entity()
class UserSettings {
  UserSettings({required this.canteenOrder, this.id = Constants.userId});

  @Id(assignable: true)
  final int id;

  final List<int> canteenOrder;
}
