import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home/home_controller.dart';
import 'package:flutter_application_1/app/models/product_model.dart';
import 'package:get/get.dart';

import 'new_product/new_product_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Aplicativo teste'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: controller.signOut,
                  ),
                ),
              ],
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
                      return ListTile(
                        onTap: () {
                          controller.openBottomSheet(product);
                        },
                        trailing: Text(product.inventory.toString()),
                        subtitle: Text(product.price.toString()),
                        title: Text(product.name.toString()),
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
