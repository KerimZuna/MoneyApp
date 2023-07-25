import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/loan.dart';
import 'package:money_app/models/modelTransaction.dart';
import 'package:money_app/topup.dart';
import 'package:money_app/pay.dart';
import 'controllers/balanceController.dart'; // Import the iznosController

class Transactions extends StatelessWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyApp'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFFC0028B),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xFFC0028B),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Obx(
                    () {
                      final balance = Get.find<iznosController>().iznos.value;
                      final dollars = (balance ~/ 1).toString();
                      final decimals =
                          (balance % 1).toStringAsFixed(2).substring(1);
                      return RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '\$',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: dollars,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: decimals,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
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
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                    child: Obx(
                      () {
                        final transactionList =
                            Get.find<iznosController>().transakcije;
                        return ListView.builder(
                          itemCount: transactionList.length,
                          itemBuilder: (context, index) {
                            final transaction = transactionList[index];
                            return ListTile(
                              leading: Text(
                                transaction.tip == tipTransakcije.DEPOSIT
                                    ? 'DEPOSIT'
                                    : 'UPLATA',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      transaction.tip == tipTransakcije.DEPOSIT
                                          ? Colors.green
                                          : Colors.red,
                                ),
                              ),
                              title: Text(transaction.naziv),
                              subtitle: Text(formatDate(transaction.datum)),
                              trailing: Text(
                                  '\$${transaction.iznos.toStringAsFixed(2)}'),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -1.3),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 130,
                    width: 380,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildIconButton("lib/assets/images/icon1.png", "Pay",
                            () {
                          Get.to(() => Pay());
                        }),
                        buildIconButton("lib/assets/images/icon2.png", "Top up",
                            () {
                          Get.to(() => TopUp());
                        }),
                        buildIconButton("lib/assets/images/icon3.png", "Loan",
                            () {
                          Get.to(() => Loan());
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton(
      String iconPath, String label, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 70, width: 70),
          const SizedBox(height: 8),
          Text(label),
        ],
      ),
    );
  }

  String formatDate(DateTime datum) {
    if (DateTime.now().difference(datum).inDays == 0) {
      return 'DANAS';
    } else if (DateTime.now().difference(datum).inDays == 1) {
      return 'JUČER';
    } else {
      return DateFormat('d MMMM').format(datum);
    }
  }
}
