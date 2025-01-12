import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:todo_list/app/core/storage/db.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';
import 'package:todo_list/app/data/models/checklist_model.dart';

class HomeController extends GetxController
    with StateMixin<List<ChecklistModel>> {
  TextEditingController checklistC = TextEditingController();
  List<ChecklistModel> checklists = [];
  List<ChecklistModel> filteredChecklists = [];

  @override
  void onInit() async {
    super.onInit();
    await getAllChecklists();
  }

  Future<void> getAllChecklists() async {
    try {
      change(filteredChecklists, status: RxStatus.loading());
      final listData = await Db.instance.checklistModels.where().findAll();
      checklists.assignAll(listData);
      filteredChecklists.assignAll(checklists);
      if (filteredChecklists.isEmpty) {
        change(filteredChecklists, status: RxStatus.empty());
      } else {
        change(filteredChecklists, status: RxStatus.success());
      }
    } catch (e) {
      change(filteredChecklists, status: RxStatus.error());

      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
    }
  }

  Future<void> addNew() async {
    try {
      final data = ChecklistModel()..name = checklistC.text;
      await Db.instance.writeTxn(
        () async {
          Db.instance.checklistModels.put(data);
        },
      );
      Get.back();
      getAllChecklists();
      checklistC.clear();
    } catch (e) {
      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
    }
  }

  Future<void> filter(int val) async {
    change(filteredChecklists, status: RxStatus.loading());
    try {
      switch (val) {
        case 0:
          filteredChecklists.assignAll(checklists);
          break;
        case 1:
          filteredChecklists.assignAll(
            checklists.where(
              (e) => e.items.every(
                (element) => element.itemCompletionStatus == false,
              ),
            ),
          );
          break;
        case 2:
          filteredChecklists.assignAll(
            checklists
                .where(
                  (e) => e.items.any(
                    (element) => element.itemCompletionStatus == true,
                  ),
                )
                .where(
                  (e) => !e.items.every(
                    (element) => element.itemCompletionStatus == true,
                  ),
                ),
          );
          break;
        case 3:
          filteredChecklists.assignAll(
            checklists.where(
              (e) => e.items.every(
                (element) => element.itemCompletionStatus == true,
              ),
            ),
          );

          break;
      }

      if (filteredChecklists.isEmpty) {
        change(filteredChecklists, status: RxStatus.empty());
      } else {
        change(filteredChecklists, status: RxStatus.success());
      }
    } catch (e) {
      change(filteredChecklists, status: RxStatus.error());

      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
    }
  }

  Future<void> deleteChecklist(int id) async {
    try {
      await Db.instance.writeTxn(() async {
        await Db.instance.checklistModels.delete(id);
      });
      getAllChecklists();
    } catch (e) {
      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
    }
  }

  Future<bool> checkItem(ChecklistItemModel item, ChecklistModel parent) async {
    try {
      await Db.instance.writeTxn(
        () async {
          final itemId = await Db.instance.checklistItemModels.put(item);

          final savedItem = await Db.instance.checklistItemModels.get(itemId);

          if (savedItem != null) {
            parent.items.add(savedItem);
            await parent.items.save();
          }
        },
      );

      return true;
    } catch (e) {
      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
      return false;
    }
  }
}
