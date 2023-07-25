import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/controllers/balanceController.dart';
import 'package:money_app/transactions.dart'; // Import the BalanceController

class ToWho extends StatelessWidget {
  final RxString recipientName = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoneyApp'),
        backgroundColor: Color(0xFFC0028B),
        elevation: 0.0,
        centerTitle: true, // Match the background color
      ),
      backgroundColor: Color(0xFFC0028B), // Match the background color
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'To whom?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Match the text color
                ),
              ),
            ),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white, // Set the color of the line
                    width: 2.0, // Set the width of the line
                  ),
                ),
              ),
              child: TextField(
                onChanged: (value) => recipientName.value = value,
                style: TextStyle(color: Colors.white), // Match the text color
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(
                      0xFFC0028B), // Set the background color of the input field
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Colors.white), // Set the color of the bottom border
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors
                            .white), // Set the color of the bottom border when focused
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0), // No radius
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                height: 70,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    final double amount = double.tryParse(Get.arguments) ?? 0.0;
                    Get.find<iznosController>().uplatiIznos(amount);
                    Get.to(() => Transactions());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF9E6F3).withOpacity(0.9),
                  ),
                  child: Text(
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
