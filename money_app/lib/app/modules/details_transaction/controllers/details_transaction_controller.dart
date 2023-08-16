import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../home/views/home.dart';

class DetailsTransactionController extends GetxController {
  IconData getTransactionIcon(TransactionType type) {
    if (type == TransactionType.deposit) {
      return Icons.add_circle_rounded;
    } else if (type == TransactionType.loan) {
      return Icons.assured_workload_outlined;
    } else {
      return Icons.shopping_bag;
    }
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('d MMMM yyyy, HH:mm').format(dateTime);
  }
}
