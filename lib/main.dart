import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:todo_list/app/core/storage/db.dart';
import 'package:todo_list/app/core/themes/dark_mode.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Db.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: "Application",
          initialRoute: Routes.HOME,
          getPages: AppPages.routes,
          theme: darkMode,
          debugShowCheckedModeBanner: false,
          smartManagement: SmartManagement.full,
        );
      },
    ),
  );
}
