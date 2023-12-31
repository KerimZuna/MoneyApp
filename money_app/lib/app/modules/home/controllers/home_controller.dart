import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_app/app/modules/home/views/home.dart';

class HomeController extends GetxController {
  var amount = 0.0.obs;
  var transaction = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    amount.value = 150.25;
    transaction.value = _getDummyTransactions();
  }

  void addAmount(double amountToAdd) {
    amount.value += amountToAdd;
    _addTransaction(Transaction(
      type: TransactionType.deposit,
      amount: amountToAdd,
      date: DateTime.now(),
    ));
  }

  void paymentAmount(double amountForPayment, String recipientName) {
    amount.value -= amountForPayment;
    _addTransaction(Transaction(
        type: TransactionType.payment,
        amount: amountForPayment,
        name: recipientName,
        date: DateTime.now()));
  }

  void loanAmount(double amountForLoan) {
    amount.value += amountForLoan;
    _addTransaction(Transaction(
      type: TransactionType.loan,
      amount: amountForLoan,
      date: DateTime.now(),
    ));
  }

  void _addTransaction(Transaction newTransaction) {
    transaction.insert(0, newTransaction);
  }

  List<Transaction> _getDummyTransactions() {
    return [
      Transaction(
        type: TransactionType.payment,
        amount: 18.99,
        date: DateTime.now().subtract(const Duration(days: 1)),
        name: 'Konzum',
      ),
      Transaction(
        type: TransactionType.payment,
        amount: 175.00,
        date: DateTime.now().subtract(const Duration(days: 1)),
        name: 'Sport Vision',
      ),
      Transaction(
        type: TransactionType.payment,
        amount: 21.75,
        date: DateTime.now().subtract(const Duration(days: 1)),
        name: 'Udemy',
      ),
    ];
  }

  String formatDate(DateTime datum) {
    if (DateTime.now().difference(datum).inDays == 0) {
      return 'TODAY';
    } else if (DateTime.now().difference(datum).inDays == 1) {
      return 'YESTERDAY';
    } else {
      return DateFormat('d MMMM').format(datum);
    }
  }
}
