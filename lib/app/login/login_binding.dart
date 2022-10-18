import 'package:flutter_application_1/app/login/register/register_controller.dart';
import 'package:get/instance_manager.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(Get.find(), Get.find()));
  }
}
