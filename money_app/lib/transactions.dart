import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/balanceController.dart';

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MoneyApp'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFFC0028B),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Color(0xFFC0028B),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80), // Adjust the top padding as needed
                    child: Obx(
                      () {
                        final balance = Get.find<iznosController>().iznos.value;
                        final dollars = (balance ~/ 1).toString();
                        final decimals = (balance % 1).toStringAsFixed(2).substring(1);
                        return RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$', // Dollar sign with smaller size
                                style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: dollars, // Hundreds with larger size
                                style: const TextStyle(color: Colors.white, fontSize: 60, fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: decimals, // Decimals with same size as the dollar sign
                                style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    color: Colors.white, // Set the color for the remaining two-thirds of the screen
                    child: Center(
                      child: Text(
                        'Remaining Two-Thirds',
                        style: const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, // Position the box at the bottom of the Stack
                    left: 0, // Position the box to the left of the Stack
                    right: 0, // Position the box to the right of the Stack
                    child: Container(
                      height: 80, // Adjust the height of the box as needed
                      color: Colors.grey, // Set the color of the box
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            label: Text('Pay'),
                            onPressed: () {
                              // Handle the first icon button press
                              // Add your logic here
                            },
                            icon: ImageIcon(AssetImage("assets/images/icon1.png")), // Replace 'icon1' with the first icon you want to display
                          ),
                          ElevatedButton.icon(
                            label: Text('Top up'),
                            onPressed: () {
                              print('Radi');
                            },
                            icon: ImageIcon(AssetImage("assets/images/icon2.png")), // Replace 'icon2' with the second icon you want to display
                          ),
                          ElevatedButton.icon(
                            label: Text('Loan'),
                            onPressed: () {
                              // Handle the third icon button press
                              // Add your logic here
                            },
                            icon: ImageIcon(AssetImage("assets/images/icon3.png")), // Replace 'icon3' with the third icon you want to display
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
