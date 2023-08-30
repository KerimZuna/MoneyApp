enum  TransactionType{
  payment,
  deposit,
  loan,
}

class Transaction {
  late final TransactionType type;
  late final double amount;
  late final DateTime date;
  late final String name;
  Transaction({
    required this.type,
    required this.amount,
    required this.date,
    this.name = '',
  });
}