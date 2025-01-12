import 'package:get/get.dart';

import '../modules/checklist/bindings/checklist_binding.dart';
import '../modules/checklist/views/checklist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_UP;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHECKLIST,
      page: () => const ChecklistView(),
      binding: ChecklistBinding(),
    ),
  ];
}
