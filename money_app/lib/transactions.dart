import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/loan.dart';
import 'package:money_app/models/modelTransaction.dart';
import 'package:money_app/topup.dart';
import 'package:money_app/pay.dart';
import 'controllers/balanceController.dart';
import 'detailsTransaction.dart';

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
                  color: const Color(0xFFF7F7F7),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                    child: Obx(
                      () {
                        final transactionList =
                            Get.find<iznosController>().transakcije;
                        final groupedTransactions =
                            _groupTransactionsByDate(transactionList);

                        return ListView.builder(
                          itemCount: groupedTransactions.length,
                          itemBuilder: (context, index) {
                            final date =
                                groupedTransactions.keys.elementAt(index);
                            final transactions = groupedTransactions[date];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 5, 20, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 5, 0, 10),
                                    child: Text(
                                      formatDate(date),
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: Colors.grey[500],
                                      ),
                                    ),
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: transactions?.length,
                                  itemBuilder: (context, index) {
                                    final transaction = transactions?[index];
                                    String amountText =
                                        '${transaction?.iznos.toStringAsFixed(2)}';
                                    IconData iconData;
                                    String transactionText;

                                    if (transaction?.tip ==
                                        tipTransakcije.DEPOSIT) {
                                      iconData = Icons.add_circle_rounded;
                                      transactionText = 'Top Up';
                                      amountText = '+$amountText';
                                    } else if (transaction?.tip ==
                                        tipTransakcije.LOAN) {
                                      iconData =
                                          Icons.assured_workload_outlined;
                                      transactionText = 'Loan';
                                      amountText = '+$amountText';
                                    } else {
                                      iconData = Icons.shopping_bag;
                                      transactionText = transaction!.naziv;
                                    }

                                    return ElevatedButton(
                                      onPressed: () {
                                        Get.to(() => DetailsTransaction(
                                            transaction: transaction));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black,
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                      ),
                                      child: ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color(0xFFC0028B),
                                                width: 0.2),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: const Color(0xFFC0028B),
                                          ),
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            iconData,
                                            color: Colors.white,
                                          ),
                                        ),
                                        title: Text(
                                          transactionText,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                        trailing: Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: amountText.substring(
                                                    0, amountText.indexOf('.')),
                                                style: TextStyle(
                                                  color: transaction?.tip ==
                                                          tipTransakcije.DEPOSIT
                                                      ? Colors.pink
                                                      : Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              TextSpan(
                                                text: amountText.substring(
                                                    amountText.indexOf('.')),
                                                style: TextStyle(
                                                  color: transaction?.tip ==
                                                          tipTransakcije.DEPOSIT
                                                      ? Colors.pink
                                                      : Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
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

  Map<DateTime, List<Transakcije>> _groupTransactionsByDate(
      List<Transakcije> transactions) {
    final Map<DateTime, List<Transakcije>> groupedTransactions = {};

    for (var transaction in transactions) {
      final date = DateTime(transaction.datum.year, transaction.datum.month,
          transaction.datum.day);

      if (!groupedTransactions.containsKey(date)) {
        groupedTransactions[date] = [];
      }

      groupedTransactions[date]?.add(transaction);
    }

    return groupedTransactions;
  }

  String formatDate(DateTime datum) {
    return iznosController().formatDate(datum);
  }
}
