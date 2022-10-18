import 'package:get/get.dart';

import 'new_product_controller.dart';

class NewProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NewProductController(Get.find(), Get.find()));
  }
}
