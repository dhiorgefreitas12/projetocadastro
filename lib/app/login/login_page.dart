import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/login/login_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone_android,
                    size: Get.width * 0.3,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login Application',
                    style: GoogleFonts.bebasNeue(fontSize: 30),
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
                  Container(
                    width: Get.width * 0.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: controller.setLogin,
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
