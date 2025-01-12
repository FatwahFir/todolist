import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_list/app/components/checklist_item.dart';
import 'package:todo_list/app/components/my_dialog.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';

import '../controllers/checklist_controller.dart';

class ChecklistView extends GetView<ChecklistController> {
  const ChecklistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(result: controller.isAnyUpdate);
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Obx(
          () => Text(
            controller.name.value,
            style: context.titleLage,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          top: 20.w,
        ),
        child: controller.obx(
          (items) {
            return ListView.builder(
              itemCount: items?.length ?? 0,
              itemBuilder: (context, index) => ChecklistItem(
                key: UniqueKey(),
                item: items![index],
              ),
            );
          },
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
          onEmpty: Center(
            child: Text(
              'There is no list available',
              style: context.bodyMedium,
            ),
          ),
          onError: (error) {
            return Center(
              child: Text(
                'An error occured: $error',
                style: context.bodyMedium,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'btnAddList',
        onPressed: () => MyDialog.showAddDialog(
          'What would you do?',
          controller.itemC,
          () => controller.addNewItem(),
        ),
        // onPressed: () {},
        child: Icon(
          Iconsax.add,
          color: context.inversPrimary,
        ),
      ),
    );
  }
}
