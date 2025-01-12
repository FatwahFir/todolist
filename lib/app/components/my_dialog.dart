import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_list/app/components/my_button.dart';
import 'package:todo_list/app/components/my_textfield.dart';

class MyDialog {
  MyDialog._();
  static void showAddDialog(
      String text, TextEditingController controller, Function()? ontap) {
    Get.defaultDialog(
      title: text,
      content: MyTextfield(
        hintText: "Type here...",
        controller: controller,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                  child: MyButton(
                text: "Cancel",
                margin: 0,
                padding: 15,
                onTap: () => Get.back(),
              )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: MyButton(
                text: "Save",
                margin: 0,
                padding: 15,
                onTap: ontap,
              )),
            ],
          ),
        )
      ],
    );
  }

  static void confirm({Function()? onConfirm}) {
    Get.defaultDialog(
      title: "Confirm",
      content: Text(
        'Are you sure?',
        style: TextStyle(
          fontSize: 16.sp,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Row(
            children: [
              Expanded(
                  child: MyButton(
                text: "Cancel",
                margin: 0,
                padding: 15,
                onTap: () => Get.back(),
              )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: MyButton(
                text: "Yes",
                margin: 0,
                padding: 15,
                onTap: onConfirm,
              )),
            ],
          ),
        )
      ],
    );
  }
}
