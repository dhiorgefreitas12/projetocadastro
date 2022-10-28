import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/auth/auth_controller.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();

  AuthController authController;
  RegisterController(this.authController);

  TextEditingController namecontroller = TextEditingController();

  TextEditingController logincontroller = TextEditingController();

  TextEditingController cpfcontroller = TextEditingController();

  TextEditingController cepcontroller = TextEditingController();

  TextEditingController roadcontroller = TextEditingController();

  TextEditingController numbercontroller = TextEditingController();

  TextEditingController districtcontroller = TextEditingController();

  TextEditingController citycontroller = TextEditingController();

  TextEditingController sstatecontroller = TextEditingController();

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
        namecontroller.text,
        logincontroller.text,
        password2controller.text,
        cepcontroller.text,
        roadcontroller.text,
        numbercontroller.text,
        districtcontroller.text,
        citycontroller.text,
        sstatecontroller.text,
      );
      if (authController.userLoged.value.email != null) {
        Get.toNamed('/home');
      }
    } else {
      return null;
    }
  }
}
