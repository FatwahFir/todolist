import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';
import 'package:todo_list/app/data/models/checklist_model.dart';
import 'package:todo_list/app/modules/home/controllers/home_controller.dart';

class HomeCheckItem extends StatefulWidget {
  const HomeCheckItem({
    super.key,
    required this.item,
    required this.parent,
  });
  final ChecklistItemModel item;
  final ChecklistModel parent;

  @override
  State<HomeCheckItem> createState() => _HomeCheckItemState();
}

class _HomeCheckItemState extends State<HomeCheckItem> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    status = widget.item.itemCompletionStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: context.inversPrimary,
          fillColor: const WidgetStatePropertyAll(
            Colors.transparent,
          ),
          value: status,
          onChanged: (val) async {
            widget.item.itemCompletionStatus = val!;
            final res = await Get.find<HomeController>()
                .checkItem(widget.item, widget.parent);
            if (res) {
              setState(() {
                status = val;
              });
            }
          },
        ),
        Flexible(
          child: Text(
            textAlign: TextAlign.left,
            widget.item.name,
            style: context.bodySmall.copyWith(
              decoration:
                  status ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
