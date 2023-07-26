import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoanController extends GetxController {
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
    // Simulating the application status check
    // You can implement this based on your backend logic
    // Here, we just set appliedBefore to true after the first application
    appliedBefore.value = true;
  }

  Future<int> generateRandomNumber() async {
    final response = await http.get(Uri.parse('https://www.randomnumberapi.com/api/v1/int'));
    if (response.statusCode == 200) {
      final data = int.tryParse(response.body);
      if (data != null) {
        return data;
      }
    }
    // Return a default value if the API call fails
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

    // Calculate loan decision based on the rules
    final randomNumber = await generateRandomNumber();
    final accountMoney = 1500; // Replace with actual account money value

    if (randomNumber <= 50 ||
        accountMoney <= 1000 ||
        monthlySalary.value <= 1000 ||
        loanAmount.value / loanTerm.value * 12 >= monthlySalary.value / 3) {
      // Declined case
      Get.dialog(
        AlertDialog(
          title: Text('DECLINED'),
          content: Text('Ooopsss. Your application has been declined. It’s not your fault, it’s a financial crisis.'),
        ),
      );
    } else {
      // Approved case
      Get.dialog(
        AlertDialog(
          title: Text('APPROVED'),
          content: Text('Yeeeyyy !! Congrats. Your application has been approved. Don’t tell your friends you have money!'),
        ),
      );

      // Add a new transaction to the user's account
      // Replace this with your actual transaction logic
      // addTransaction('Loan', loanAmount.value);
    }

    // Mark as applied before
    appliedBefore.value = true;
  }
}
