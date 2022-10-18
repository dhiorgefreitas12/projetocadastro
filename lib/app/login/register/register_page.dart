import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/app/login/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Registar Usuário'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.logincontroller,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Email Obrigatorio';
                    } else if (!EmailValidator.validate(value)) {
                      return 'Email invalido';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.passworddcontroller,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Senha obrigatoria';
                    } else if (value.length < 6) {
                      return 'Senha maior ou igual a 6 digitos';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: controller.password2controller,
                  validator: (value) {
                    if (controller.password2controller.text !=
                        controller.passworddcontroller.text) {
                      return 'Senha está difente';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirmar Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  width: 150,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    child: Text('Cadastrar'),
                    onPressed: controller.setRegister,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
