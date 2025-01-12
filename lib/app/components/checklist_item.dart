import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/components/my_dialog.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';
import 'package:todo_list/app/modules/checklist/controllers/checklist_controller.dart';

class ChecklistItem extends StatefulWidget {
  const ChecklistItem({
    super.key,
    required this.item,
  });

  final ChecklistItemModel item;

  @override
  State<ChecklistItem> createState() => _ChecklistItemState();
}

class _ChecklistItemState extends State<ChecklistItem> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    status = widget.item.itemCompletionStatus;
  }

  @override
  Widget build(BuildContext context) {
    final textC = TextEditingController(text: widget.item.name);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              checkColor: context.inversPrimary,
              fillColor: const WidgetStatePropertyAll(Colors.transparent),
              value: status,
              onChanged: (val) async {
                widget.item.itemCompletionStatus = val!;
                final res = await Get.find<ChecklistController>()
                    .checkOrUpdateItem(widget.item);
                if (res) {
                  setState(() {
                    status = val;
                  });
                }
              },
            ),
            Text(
              widget.item.name,
              style: context.bodyMedium.copyWith(
                decoration:
                    status ? TextDecoration.lineThrough : TextDecoration.none,
              ),
            ),
          ],
        ),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                value: 'edit',
                child: const Text('Edit'),
                onTap: () {
                  MyDialog.showAddDialog('Edit todo item', textC, () async {
                    widget.item.name = textC.text;
                    final res = await Get.find<ChecklistController>()
                        .checkOrUpdateItem(widget.item);
                    if (res) {
                      Get.find<ChecklistController>().getItems();
                    }
                    Get.back();
                  });
                },
              ),
              PopupMenuItem(
                value: 'delete',
                child: const Text('Delete'),
                onTap: () => MyDialog.confirm(
                  onConfirm: () async {
                    await Get.find<ChecklistController>()
                        .deleteItem(widget.item.id);
                    Get.back();
                  },
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
