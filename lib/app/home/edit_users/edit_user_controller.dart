import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';

import '../../app_controller.dart';
import '../../auth/auth_controller.dart';

class EditUserController extends GetxController {
  AppController appController;
  AuthController authController;
  EditUserController(this.appController, this.authController);

  final formKey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();

  TextEditingController cepcontroller = TextEditingController();

  TextEditingController roadcontroller = TextEditingController();

  TextEditingController numbercontroller = TextEditingController();

  TextEditingController districtcontroller = TextEditingController();

  TextEditingController citycontroller = TextEditingController();

  TextEditingController sstatecontroller = TextEditingController();

  @override
  void onInit() {
    namecontroller.text = authController.userLoged.value.name.toString();

    cepcontroller.text = authController.userLoged.value.cep.toString();
    roadcontroller.text = authController.userLoged.value.road.toString();
    numbercontroller.text = authController.userLoged.value.number.toString();
    districtcontroller.text =
        authController.userLoged.value.district.toString();
    citycontroller.text = authController.userLoged.value.city.toString();
    sstatecontroller.text = authController.userLoged.value.sstate.toString();
    super.onInit();
  }

  editUser() async {
    print(authController.userLoged.value.name);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(authController.userLoged.value.email)
        .update({
      "name": namecontroller.text,
      "cep": cepcontroller.text,
      "road": roadcontroller.text,
      "number": numbercontroller.text,
      "district": districtcontroller.text,
      "city": citycontroller.text,
      "sstate": sstatecontroller.text,
    });
    authController.updateUser();
    print(authController.userLoged.value.name);
    Get.back();
  }
}
