import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/transactions.dart';
import 'controllers/balanceController.dart';

class TopUp extends StatelessWidget {
  final RxString inputAmount = ''.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFC0028B),
      appBar: AppBar(
        title: const Text('MoneyApp'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: const Color(0xFFC0028B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'How much?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 50),
            Obx(() => Center(
                  child: Text(
                    inputAmount.value.isEmpty ? '0' : inputAmount.value,
                    style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
            const SizedBox(height: 120),
            NumberInput(onNumberSelected: (value) {
              if (value == '<') {
                if (inputAmount.value.isNotEmpty) {
                  inputAmount.value = inputAmount.value
                      .substring(0, inputAmount.value.length - 1);
                }
              } else {
                inputAmount.value = inputAmount.value + value;
              }
            }),
            const SizedBox(height: 120),
            Center(
              child: SizedBox(
                height: 70,
                width: 220,
                child: ElevatedButton(
                  onPressed: () {
                    final double amount =
                        double.tryParse(inputAmount.value) ?? 0.0;
                    Get.find<iznosController>().dodajIznos(amount);
                    Get.to(() => const Transactions());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF9E6F3).withOpacity(0.9),
                  ),
                  child: const Text(
                    'Top Up',
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

class NumberInput extends StatelessWidget {
  final ValueChanged<String> onNumberSelected;

  const NumberInput({Key? key, required this.onNumberSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFC0028B),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 80, mainAxisSpacing: 10),
        itemCount: 12,
        itemBuilder: (context, index) {
          if (index == 11) {
            return buildNumberButton('<', Colors.white);
          } else if (index == 10) {
            return buildNumberButton('0', Colors.white);
          } else if (index == 9) {
            return buildNumberButton('.', Colors.white);
          } else {
            final number = index + 1;
            return buildNumberButton(number.toString(), Colors.white);
          }
        },
      ),
    );
  }

  Widget buildNumberButton(String text, Color textColor) {
    return TextButton(
      onPressed: () => onNumberSelected(text),
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: textColor),
      ),
    );
  }
}
