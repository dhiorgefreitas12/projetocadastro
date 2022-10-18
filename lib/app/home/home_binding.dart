import 'package:get/get.dart';

import 'home_controller.dart';
import 'new_product/new_product_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController(Get.find(), Get.find()));
  }
}
