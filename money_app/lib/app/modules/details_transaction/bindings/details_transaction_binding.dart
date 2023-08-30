import 'package:get/get.dart';

import '../controllers/details_transaction_controller.dart';

class DetailsTransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsTransactionController>(
      () => DetailsTransactionController(),
    );
  }
}
