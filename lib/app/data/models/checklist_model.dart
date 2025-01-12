import 'package:isar/isar.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';

part 'checklist_model.g.dart';

@collection
class ChecklistModel {
  Id id = Isar.autoIncrement;
  late String name;
  @Backlink(to: 'checklist')
  final items = IsarLinks<ChecklistItemModel>();
}
