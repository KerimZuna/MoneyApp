import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get.dart';
import 'package:money_app/transactions.dart';
import 'controllers/balanceController.dart';

void main(){
  Get.put(iznosController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MoneyApp',
      home: Transactions(),
    );
  }
}