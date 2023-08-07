import 'balance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoanController extends GetxController {
  final AmountController _amountController = Get.find<AmountController>();
  final RxBool acceptedTerms = false.obs;
  final RxBool appliedBefore = false.obs;
  final RxInt monthlySalary = RxInt(0);
  final RxInt loanAmount = RxInt(0);
  final RxInt loanTerm = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    checkApplicationStatus();
  }

  void checkApplicationStatus() {
    appliedBefore.value = false;
  }

  Future<int> generateRandomNumber() async {
    final response = await http
        .get(Uri.parse('http://www.randomnumberapi.com/api/v1.0/random'));
    if (response.statusCode == 200) {
      final data = response.body.replaceAll('[', '').replaceAll(']', '');
      final randomNumber = int.tryParse(data);
      if (randomNumber != null) {
        return randomNumber;
      }
    }
    return 0;
  }

  void applyForLoan() async {
    if (appliedBefore.value) {
      Get.dialog(
        const AlertDialog(
          title: Text('Ooopsss, you applied before.'),
          content: Text('Wait for notification from us.'),
        ),
      );
      return;
    }

    if (!acceptedTerms.value) {
      Get.snackbar(
        'Error',
        'Please accept the Terms & Conditions first.',
        backgroundColor: Colors.white,
        colorText: Colors.black,
        snackPosition: SnackPosition.TOP,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        snackStyle: SnackStyle.FLOATING,
      );
      return;
    }

    final randomNumber = await generateRandomNumber();
    final accountMoney = _amountController.amount.value;

    if (randomNumber <= 50 ||
        accountMoney <= 1000 ||
        monthlySalary.value <= 1000 ||
        loanAmount.value / loanTerm.value * 12 >= monthlySalary.value / 3) {
      Get.dialog(
        const AlertDialog(
          title: Text('DECLINED'),
          content: Text(
              'Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis.'),
        ),
      );
    } else {
      Get.dialog(
        const AlertDialog(
          title: Text('APPROVED'),
          content: Text(
              'Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!'),
        ),
      );

      _amountController.loanAmount(loanAmount.value.toDouble());
    }

    appliedBefore.value = true;
  }
}
