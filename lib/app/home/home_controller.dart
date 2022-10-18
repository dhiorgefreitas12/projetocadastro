import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home/edit_product/edit_product_page.dart';
import 'package:flutter_application_1/app/models/product_model.dart';
import 'package:get/get.dart';

import '../app_controller.dart';
import '../auth/auth_controller.dart';

class HomeController extends GetxController {
  AppController appController;
  AuthController authController;
  HomeController(this.appController, this.authController);

  void openBottomSheet(productModel product) {
    Get.bottomSheet(
      Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Deletar Produto',
              style: TextStyle(fontSize: 24),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.to(() => EditPage(product: product));
            },
            icon: Icon(Icons.edit),
            label: Text('Editar'),
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
              icon: Icon(Icons.delete),
              label: Text('Deletar'),
            ),
          ),
          OutlinedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.cancel),
            label: Text('Cancelar'),
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
    Get.offAllNamed('/login');
  }
}
