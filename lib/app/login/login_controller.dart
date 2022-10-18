import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/auth/auth_controller.dart';
import 'package:get/get.dart';

import 'package:email_validator/email_validator.dart';

import '../app_controller.dart';

class LoginController extends GetxController {
  AppController appController;
  AuthController authController;

  LoginController(this.appController, this.authController);

  final formKey = GlobalKey<FormState>();

  TextEditingController logincontroller = TextEditingController();

  TextEditingController passworddcontroller = TextEditingController();

  @override
  void onInit() {
    logincontroller.clear();
  }

  setLogin() async {
    if (formKey.currentState!.validate()) {
      await authController.setLogin(
          logincontroller.text, passworddcontroller.text);
      if (authController.userLoged.email != null) {
        Get.toNamed('/home');
      }
    } else {
      return null;
    }
  }
}
