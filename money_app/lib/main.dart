import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:money_app/transactions.dart';
import 'controllers/balanceController.dart';

void main() {
  Get.put(iznosController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'MoneyApp',
      debugShowCheckedModeBanner: false,
      home: Transactions(),
    );
  }
}
