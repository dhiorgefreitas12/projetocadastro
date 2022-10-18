import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Container(
            height: Get.height * 1,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.black,
              ],
            )),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 40, right: 40, top: 110, bottom: 90),
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.people,
                      size: Get.width * 0.3,
                    ),
                    TextFormField(
                      controller: controller.logincontroller,
                      decoration: InputDecoration(
                        labelText: 'Login',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Email obrigatorio';
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Senha obrigatoria';
                        } else {
                          return null;
                        }
                      },
                    ),
                    Row(
                      children: [
                        TextButton(
                          child: Text('Cadastrar-se'),
                          onPressed: () {
                            Get.toNamed('register');
                          },
                        )
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        child: Text('Entrar'),
                        onPressed: controller.setLogin),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
