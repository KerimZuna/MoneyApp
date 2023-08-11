import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Home/views/home.dart';

class DetailsTransactionController extends GetxController {
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
