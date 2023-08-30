import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:money_app/app/routes/app_pages.dart';
void main() {
  runApp(
    GetMaterialApp(
      title: "MoneyApp",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    ),
  );
}
