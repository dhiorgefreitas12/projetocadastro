import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home/edit_product/edit_product_page.dart';
import 'package:flutter_application_1/app/login/login_controller.dart';
import 'package:flutter_application_1/app/models/product_model.dart';
import 'package:flutter_application_1/app/models/user_model.dart';
import 'package:get/get.dart';

import '../app_controller.dart';
import '../auth/auth_controller.dart';

class HomeController extends GetxController {
  AppController appController;
  AuthController authController;
  HomeController(this.appController, this.authController);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openBottomSheet(productModel product) {
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                'Configurações do Produto',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.to(() => EditPage(product: product));
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.black,
            ),
            label: const Text(
              'Editar',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: OutlinedButton.icon(
              onPressed: () {
                Get.back();
                FirebaseFirestore.instance
                    .collection('product')
                    .doc(product.id)
                    .delete();
              },
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              label: Text(
                'Deletar',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.cancel,
              color: Colors.black,
            ),
            label: Text(
              'Cancelar',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  signOut() async {
    authController.signOut();
    Get.offAllNamed('/login');
  }

  deletesers(UserModel users) async {
    FirebaseFirestore.instance.collection('users').doc(users.email).delete();
    signOut();
  }
}
