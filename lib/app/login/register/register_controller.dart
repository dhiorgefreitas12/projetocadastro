import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/auth/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  AuthController authController;
  RegisterController(this.authController);

  TextEditingController logincontroller = TextEditingController();

  TextEditingController passworddcontroller = TextEditingController();

  TextEditingController password2controller = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    logincontroller.clear();
    passworddcontroller.clear();
    password2controller.clear();
  }

  setRegister() async {
    if (formKey.currentState!.validate()) {
      await authController.setRegister(
          logincontroller.text, password2controller.text);
      if (authController.userLoged.email != null) {
        Get.toNamed('/home');
      }
    } else {
      return null;
    }
  }
}
