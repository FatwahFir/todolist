import 'package:get/get.dart';

import '../controllers/checklist_controller.dart';

class ChecklistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChecklistController>(
      () => ChecklistController(),
    );
  }
}
