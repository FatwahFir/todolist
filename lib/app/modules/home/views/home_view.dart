import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:todo_list/app/components/home_check_item.dart';
import 'package:todo_list/app/components/my_dialog.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';
import 'package:todo_list/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (checklists) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: checklists?.length ?? 0,
              itemBuilder: (context, index) {
                var data = checklists?[index];
                return GestureDetector(
                  onTap: () async {
                    bool isAnyUpdate = await Get.toNamed(
                      Routes.CHECKLIST,
                      arguments: {'checklist_id': data?.id},
                    );
                    if (isAnyUpdate) {
                      controller.getAllChecklists();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: context.secondary,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.screenWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  data?.name ?? '',
                                  style: context.titleMedium,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => MyDialog.confirm(
                                  onConfirm: () {
                                    controller.deleteChecklist(
                                      data?.id ?? 0,
                                    );
                                    Get.back();
                                  },
                                ),
                                child: Icon(
                                  Iconsax.trash,
                                  size: 20.w,
                                ),
                              ).marginOnly(left: 5.w)
                            ],
                          ),
                        ),
                        ...?data?.items.map(
                          (val) => HomeCheckItem(
                            key: UniqueKey(),
                            item: val,
                            parent: data,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
        onEmpty: Center(
          child: Text(
            'There is no todolist available',
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
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.h,
            right: 10.w,
            child: FloatingActionButton(
              heroTag: 'btnAddTodo',
              onPressed: () => MyDialog.showAddDialog(
                "Add new todolist",
                controller.checklistC,
                () => controller.addNew(),
              ),
              child: Icon(
                Iconsax.add,
                color: context.inversPrimary,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 75.w,
            child: FloatingActionButton(
              heroTag: 'btnSort',
              onPressed: () {
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    MediaQuery.of(context).size.width - 75.w,
                    MediaQuery.of(context).size.height - 16.h,
                    0.0,
                    0.0,
                  ),
                  items: [
                    const PopupMenuItem(
                      value: 0,
                      child: Text("Reset"),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Text("Not done"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("Worked on"),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text("Done"),
                    ),
                  ],
                ).then((value) {
                  if (value != null) {
                    controller.filter(value);
                  }
                });
              },
              child: Icon(
                Iconsax.sort,
                color: context.inversPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
