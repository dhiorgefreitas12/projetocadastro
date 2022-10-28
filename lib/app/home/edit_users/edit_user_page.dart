import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/auth/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:search_cep/search_cep.dart';
import 'edit_user_controller.dart';

class EditUserPage extends GetView<EditUserController> {
  const EditUserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        centerTitle: true,
        title: const Text('Editar Dados Pessoais'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.namecontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nome Obrigatorio';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.cepcontroller,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Cep Obrigatorio';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Cep',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    onChanged: ((value) async {
                      if (value.length == 8) {
                        final viaCepSearchCep = ViaCepSearchCep();
                        final infoCepJSON =
                            await viaCepSearchCep.searchInfoByCep(
                                cep: controller.cepcontroller.text);
                        infoCepJSON.fold((_) => null, (data) {
                          controller.citycontroller.text = data.localidade!;
                          controller.districtcontroller.text = data.bairro!;
                          controller.roadcontroller.text = data.logradouro!;
                          controller.sstatecontroller.text = data.uf!;
                        });
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.roadcontroller,
                    decoration: InputDecoration(
                      labelText: 'Rua',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: controller.districtcontroller,
                          decoration: InputDecoration(
                            labelText: 'Bairro',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: controller.numbercontroller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: 'N°',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: controller.citycontroller,
                          decoration: InputDecoration(
                            labelText: 'Cidade',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextFormField(
                            controller: controller.sstatecontroller,
                            decoration: InputDecoration(
                              labelText: 'Estado',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: Text('Atualizar'),
                      onPressed: controller.editUser,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
