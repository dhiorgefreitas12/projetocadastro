import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_controller.dart';
import '../../auth/auth_controller.dart';

class NewProductController extends GetxController {
  AppController appController;
  AuthController authController;
  NewProductController(this.appController, this.authController);

  TextEditingController namecontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController codecontroller = TextEditingController();

  TextEditingController inventorycontroller = TextEditingController();
}
