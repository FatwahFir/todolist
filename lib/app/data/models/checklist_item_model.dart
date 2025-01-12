import 'package:isar/isar.dart';
import 'package:todo_list/app/data/models/checklist_model.dart';

part 'checklist_item_model.g.dart';

@collection
class ChecklistItemModel {
  Id id = Isar.autoIncrement;
  late String name;
  late bool itemCompletionStatus;

  final checklist = IsarLink<ChecklistModel>();
}
