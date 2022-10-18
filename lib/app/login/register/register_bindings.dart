import 'package:flutter_application_1/app/login/register/register_controller.dart';
import 'package:get/instance_manager.dart';

class RegisterBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController(Get.find()));
  }
}
