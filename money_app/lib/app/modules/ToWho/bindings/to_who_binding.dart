import 'package:get/get.dart';

import '../controllers/to_who_controller.dart';

class ToWhoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToWhoController>(
      () => ToWhoController(),
    );
  }
}
