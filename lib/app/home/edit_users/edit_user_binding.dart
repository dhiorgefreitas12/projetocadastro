import 'package:get/instance_manager.dart';

import 'edit_user_controller.dart';

class EditUserBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(EditUserController(Get.find(), Get.find()));
  }
}
