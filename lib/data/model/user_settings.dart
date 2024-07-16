import 'package:objectbox/objectbox.dart';
import 'package:simple_mensa/util/constants.dart';

@Entity()
class UserSettings {
  UserSettings({
    this.id = Constants.userId,
    this.canteenOrder = const [],
    this.useDarkTheme = false,
    this.highlightVegan = false,
      this.showOnlyStudentPrices = false,
      this.version});

  @Id(assignable: true)
  final int id;

  final List<int> canteenOrder;
  final bool useDarkTheme;
  final bool highlightVegan;
  final bool showOnlyStudentPrices;
  final String? version;

  UserSettings copyWith({
    List<int>? canteenOrder,
    bool? useDarkTheme,
    bool? highlightVegan,
    bool? showOnlyStudentPrices,
    String? version,
  }) {
    return UserSettings(
        canteenOrder: canteenOrder ?? this.canteenOrder,
        useDarkTheme: useDarkTheme ?? this.useDarkTheme,
        highlightVegan: highlightVegan ?? this.highlightVegan,
        showOnlyStudentPrices:
            showOnlyStudentPrices ?? this.showOnlyStudentPrices,
        version: version ?? this.version);
  }
}
