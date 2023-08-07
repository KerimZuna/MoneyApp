import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/models/transaction.dart';

class DetailsTransaction extends StatelessWidget {
  final Transaction? transaction;

  const DetailsTransaction({required this.transaction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (transaction == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('MoneyApp'),
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
        title: const Text('MoneyApp'),
        centerTitle: true,
        backgroundColor: const Color(0xFFC0028B),
        elevation: 0.0,
      ),
      body: Obx(() {
        var balance = transaction!.amount.obs;
        final RxString dollars = (balance ~/ 1).toString().obs;
        final RxString decimals = (balance % 1).toStringAsFixed(2).substring(1).obs;
        return Container(
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
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xFFC0028B),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        getTransactionIcon(transaction!.type),
                        color: Colors.white,
                        size: 60,
                      ),
                    ),
                    const Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$dollars',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 40,
                                fontWeight: FontWeight.w300),
                          ),
                          TextSpan(
                            text: '$decimals',
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
                  formatDateTime(transaction!.date),
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
                children:[
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
        );
      }),
    );
  }

  IconData getTransactionIcon(TypeOfTransaction type) {
    if (type == TypeOfTransaction.deposit) {
      return Icons.add_circle_rounded;
    } else if (type == TypeOfTransaction.loan) {
      return Icons.assured_workload_outlined;
    } else {
      return Icons.shopping_bag;
    }
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('d MMMM yyyy, HH:mm').format(dateTime);
  }
}
