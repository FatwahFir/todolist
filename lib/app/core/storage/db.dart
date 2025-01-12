import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';
import 'package:todo_list/app/data/models/checklist_model.dart';

class Db {
  static late Isar instance;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    instance = await Isar.open(
      [ChecklistModelSchema, ChecklistItemModelSchema],
      directory: dir.path,
    );
  }
}
