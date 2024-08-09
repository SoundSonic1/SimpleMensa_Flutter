import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:simple_mensa/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store) {
    // Add any additional setup code, e.g. build queries.
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, 'simple-mensa-obx'));
    return ObjectBox._create(store);
  }
}
