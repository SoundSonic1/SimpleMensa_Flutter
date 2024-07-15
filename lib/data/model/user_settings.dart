import 'package:objectbox/objectbox.dart';
import 'package:simple_mensa/util/constants.dart';

@Entity()
class UserSettings {
  UserSettings({
    this.id = Constants.userId,
    this.canteenOrder = const [],
    this.useDarkTheme = false,
    this.highlightVegan = false,
      this.version});

  @Id(assignable: true)
  final int id;

  final List<int> canteenOrder;
  final bool useDarkTheme;
  final bool highlightVegan;
  final String? version;

  UserSettings copyWith({
    List<int>? canteenOrder,
    bool? useDarkTheme,
    bool? highlightVegan,
    String? version,
  }) {
    return UserSettings(
        canteenOrder: canteenOrder ?? this.canteenOrder,
        useDarkTheme: useDarkTheme ?? this.useDarkTheme,
        highlightVegan: highlightVegan ?? this.highlightVegan,
        version: version ?? this.version);
  }
}
