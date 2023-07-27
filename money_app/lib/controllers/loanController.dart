import 'balanceController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoanController extends GetxController {
  final iznosController _iznosController = Get.find<iznosController>();
  RxBool acceptedTerms = false.obs;
  RxBool appliedBefore = false.obs;
  RxInt monthlySalary = RxInt(0);
  RxInt loanAmount = RxInt(0);
  RxInt loanTerm = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    checkApplicationStatus();
  }

  void checkApplicationStatus() {
    appliedBefore.value = false;
  }

  Future<int> generateRandomNumber() async {
  final response = await http.get(Uri.parse('http://www.randomnumberapi.com/api/v1.0/random'));
  if (response.statusCode == 200) {
    final data = response.body.replaceAll('[', '').replaceAll(']', '');
    final randomNumber = int.tryParse(data);
    if (randomNumber != null) {
      print(randomNumber);
      return randomNumber;
    }
  }
  return 0;
}


  void applyForLoan() async {
    if (appliedBefore.value) {
      Get.dialog(
        AlertDialog(
          title: Text('Ooopsss, you applied before.'),
          content: Text('Wait for notification from us.'),
        ),
      );
      return;
    }

    if (!acceptedTerms.value) {
      Get.snackbar('Error', 'Please accept the Terms & Conditions first.');
      return;
    }

    final randomNumber = await generateRandomNumber();
    final accountMoney = _iznosController.iznos.value;

    print('Random Number: $randomNumber');
    print('Account Money: $accountMoney');
    print('Monthly Salary: $monthlySalary');
    print('Loan Amount: $loanAmount');
    print('Loan Term: $loanTerm');

    if (randomNumber <= 50 ||
        accountMoney <= 1000 ||
        monthlySalary.value <= 1000 ||
        loanAmount.value / loanTerm.value * 12 >= monthlySalary.value / 3) {
      Get.dialog(
        const AlertDialog(
          title: Text('DECLINED'),
          content: Text('Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis.'),
        ),
      );
    } else {
      Get.dialog(
        const AlertDialog(
          title: Text('APPROVED'),
          content: Text('Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!'),
        ),
      );

      _iznosController.loanIznos(loanAmount.value.toDouble());
    }

    appliedBefore.value = true;
  }
}
