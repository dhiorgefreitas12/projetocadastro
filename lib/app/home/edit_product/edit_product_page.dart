import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/models/product_model.dart';
import 'package:get/get.dart';

import 'package:get/state_manager.dart';

class EditPage extends StatelessWidget {
  final ProductModel product;

  TextEditingController namecontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController inventorycontroller = TextEditingController();

  TextEditingController codecontroller = TextEditingController();

  EditPage({required this.product});
  @override
  Widget build(BuildContext context) {
    namecontroller.text = product.name.toString();
    pricecontroller.text = product.price.toString();
    inventorycontroller.text = product.inventory.toString();
    codecontroller.text = product.code.toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Teste'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Nome do Produto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: codecontroller,
                  decoration: InputDecoration(
                    hintText: 'Codigo do Produto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: inventorycontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Estoque do Produto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: pricecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Preço do Produto',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                  child: Text('Alterar Produto'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('product')
                        .doc(product.id)
                        .update({
                      "name": namecontroller.text,
                      "price": pricecontroller.text,
                      "inventory": inventorycontroller.text,
                      "code": codecontroller.text,
                    });
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
