import 'package:flutter_application_1/app/home/home_controller.dart';
import 'package:flutter_application_1/app/home/new_product/new_product_controller.dart';
import 'package:get/get.dart';
import 'app_controller.dart';
import 'app_repository.dart';
import 'auth/auth_controller.dart';
import 'auth/auth_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppRepository(), fenix: true);
    Get.lazyPut(() => AuthRepository(), fenix: true);
    Get.put(AppController(Get.find()));
    Get.put(AuthController(Get.find()));
  }
}
