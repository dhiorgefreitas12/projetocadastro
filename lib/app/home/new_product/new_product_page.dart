import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/home/new_product/new_product_controller.dart';

import 'package:get/get.dart';

class NewProductPage extends GetView<NewProductController> {
  const NewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('Teste'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              TextFormField(
                controller: controller.namecontroller,
                decoration: InputDecoration(
                  hintText: 'Nome do Produto',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: controller.codecontroller,
                  decoration: InputDecoration(
                    hintText: 'Codigo do Produto',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: controller.inventorycontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Estoque do Produto',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: TextFormField(
                  controller: controller.pricecontroller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Valor do Produto',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                if (controller.image.value == '') {
                  return Container();
                } else {
                  return Container(
                    width: Get.width * 0.5,
                    height: Get.height * 0.5,
                    child: Image.network(
                      controller.image.value,
                    ),
                  );
                }
              }),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: controller.pickAndUploadImage,
                child: Container(
                  color: Colors.grey.shade400,
                  child: SizedBox(
                    width: Get.width * 0.96,
                    height: Get.height * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.image_outlined),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Adicionar Imagem',
                          style: TextStyle(
                            fontFamily: 'Archivo',
                            fontWeight: FontWeight.w400,
                            fontSize: Get.width * 0.038,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  child: Text('Cadastrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                  ),
                  onPressed: () {
                    FirebaseFirestore.instance.collection('product').add(
                      {
                        'name': controller.namecontroller.text,
                        'price': controller.pricecontroller.text,
                        'inventory': controller.inventorycontroller.text,
                        'code': controller.codecontroller.text,
                        'image': controller.image.value,
                      },
                    );
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
