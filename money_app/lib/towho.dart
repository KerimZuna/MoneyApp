import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/controllers/balanceController.dart';
import 'package:money_app/transactions.dart';

class ToWho extends StatelessWidget {
  final RxString recipientName = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyApp'),
        backgroundColor: const Color(0xFFC0028B),
        elevation: 0.0,
        centerTitle: true, 
      ),
      backgroundColor: const Color(0xFFC0028B),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'To whom?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 100),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              child: TextField(
                onChanged: (value) => recipientName.value = value,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(
                      0xFFC0028B),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Center(
              child: SizedBox(
                height: 70,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    final double amount = double.tryParse(Get.arguments) ?? 0.0;
                    Get.find<iznosController>().uplatiIznos(amount, recipientName.value);
                    Get.off(() => Transactions());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9E6F3).withOpacity(0.9),
                  ),
                  child: const Text(
                    'Pay',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
