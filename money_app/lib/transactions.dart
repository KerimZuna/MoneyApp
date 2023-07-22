import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'controllers/balanceController.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyApp'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFC0028B),
                child: Center(
                  child: Obx(
                    () => Text(
                      'iznos: \$${Get.find<iznosController>().iznos.value.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  child: Center(
                      child: Text(
                    'Preostale dvije trećine',
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
