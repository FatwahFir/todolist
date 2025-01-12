import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/core/storage/db.dart';
import 'package:todo_list/app/data/models/checklist_item_model.dart';
import 'package:todo_list/app/data/models/checklist_model.dart';

class ChecklistController extends GetxController
    with StateMixin<List<ChecklistItemModel>> {
  TextEditingController itemC = TextEditingController();
  List<ChecklistItemModel> items = [];
  late int id;
  RxString name = ''.obs;
  ChecklistModel? current = ChecklistModel();
  bool isAnyUpdate = false;

  @override
  void onInit() async {
    super.onInit();
    id = Get.arguments['checklist_id'];
    getItems();
  }

  Future<void> addNewItem() async {
    try {
      final newItem = ChecklistItemModel()
        ..name = itemC.text
        ..itemCompletionStatus = false;

      await Db.instance.writeTxn(() async {
        final itemId = await Db.instance.checklistItemModels.put(newItem);

        final savedItem = await Db.instance.checklistItemModels.get(itemId);

        if (savedItem != null) {
          current?.items.add(savedItem);
          await current?.items.save();
        }
      });

      Get.back();
      itemC.clear();
      getItems();

      isAnyUpdate = true;
    } catch (e) {
      Get.snackbar(
        "Failed",
        "An error occurred: ${e.toString()}",
      );
      log("Error adding item: $e");
    }
  }

  Future<void> getItems() async {
    try {
      change(items, status: RxStatus.loading());
      items.clear();
      current = await Db.instance.checklistModels.get(id);
      name.value = current?.name ?? 'n/a';
      await current?.items.load();
      items.addAll(current?.items ?? []);
      if (items.isEmpty) {
        change(items, status: RxStatus.empty());
      } else {
        change(items, status: RxStatus.success());
      }
    } catch (e) {
      change(items, status: RxStatus.error());
      Get.snackbar(
        "Failed",
        "An error occured",
      );
      log(e.toString());
    }
  }

  Future<bool> checkOrUpdateItem(ChecklistItemModel item) async {
    try {
      await Db.instance.writeTxn(
        () async {
          final itemId = await Db.instance.checklistItemModels.put(item);

          final savedItem = await Db.instance.checklistItemModels.get(itemId);

          if (savedItem != null) {
            current?.items.add(savedItem);
            await current?.items.save();
          }
        },
      );

      isAnyUpdate = true;

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

  Future<void> deleteItem(int id) async {
    try {
      await Db.instance.writeTxn(() async {
        await Db.instance.checklistItemModels.delete(id);

        current?.items.removeWhere((linkedItem) => linkedItem.id == id);

        await current?.items.save();
      });
      isAnyUpdate = true;
      getItems();
    } catch (e) {
      Get.snackbar(
        "Failed",
        "Gagal menghapus item.",
      );
      log(e.toString());
    }
  }
}
