import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_app/app/modules/Home/views/home.dart';

import '../controllers/details_transaction_controller.dart';

class DetailsTransactionView extends GetView<DetailsTransactionController> {
  final Transaction? transaction;

  DetailsTransactionView({required this.transaction, Key? key})
      : super(key: key);

  final DetailsTransactionController _detailsController =
      Get.put(DetailsTransactionController());

  @override
  Widget build(BuildContext context) {
    var balance = transaction!.amount;
    final String dollars = (balance ~/ 1).toString();
    final String decimals = (balance % 1).toStringAsFixed(2).substring(1);
    if (transaction == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('MoneyApp', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: const Color(0xFFC0028B),
        ),
        body: const Center(
          child: Text('Transaction details not available.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MoneyApp', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFFC0028B),
        elevation: 0.0,
      ),
      body:
        Container(
          color: const Color(0xFFF7F7F7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 5),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFFC0028B), width: 0.2),
                        color: const Color(0xFFC0028B),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        _detailsController
                            .getTransactionIcon(transaction!.type),
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: dollars,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: decimals,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Text(
                  transaction!.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Text(
                  _detailsController.formatDateTime(transaction!.date),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFC0028B),
                          shape: BoxShape.rectangle,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(
                          Icons.receipt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Add receipt'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 70),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Text(
                  'SHARE THE COST',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  elevation: 0,
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFC0028B),
                          shape: BoxShape.rectangle,
                        ),
                        padding: const EdgeInsets.all(2),
                        child: const Icon(
                          Icons.splitscreen,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Split this bill'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Text(
                  'SUBSCRIPTION',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                        child: Text(
                          'Repeating Payment',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Switch(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(16, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Something wrong? Get help',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Transaction ID #12343595939530',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${transaction!.name} - Merchant ID #1234',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}
