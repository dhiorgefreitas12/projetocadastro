import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home/home_controller.dart';
import 'package:flutter_application_1/app/models/product_model.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            controller.scaffoldKey.currentState?.openDrawer();
          },
          icon: Image.asset(
            'assets/icons/menu_icon.png',
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('newproduct');
            },
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple,
              height: Get.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.logout),
                          onPressed: controller.signOut,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        label: Text('Editar'),
                        icon: const Icon(
                          Icons.person_pin,
                          color: Colors.white,
                          size: 80,
                        ),
                        onPressed: () {
                          Get.toNamed('/edituser');
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Email: ' +
                            controller.authController.userLoged.value.email
                                .toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      Obx(
                        (() {
                          print(controller.authController.userLoged.value);
                          return Text(
                            'Usuário: ' +
                                controller.authController.userLoged.value.name
                                    .toString(),
                            style: TextStyle(color: Colors.white),
                          );
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: const Text(
                'Deletar Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                controller
                    .deletesers(controller.authController.userLoged.value);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('product').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<productModel> products = [];
                  for (var x in snapshot.data!.docs) {
                    products.add(productModel.fromFirebase(x));
                  }
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      var product = products[index];
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  )),
                              width: 120,
                              height: 190,
                              child: InkWell(
                                onTap: () {
                                  controller.openBottomSheet(product);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/imagens/brasil.jpg',
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 120,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Text(
                                        product.name.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Estoque: ' +
                                          product.inventory.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                    Text(
                                      'R\$' + product.price.toString(),
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
