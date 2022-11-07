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
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage(
                  'assets/imagens/beautiful.jpg',
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 30),
                child: Text(
                  'Welcome\nTo\nApplication!',
                  style: GoogleFonts.anton(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: Get.width * 0.9,
          child: FloatingActionButton.extended(
            elevation: 2,
            backgroundColor: Colors.deepPurple,
            label: const Text('Entrar'),
            onPressed: () {
              Get.bottomSheet(
                SingleChildScrollView(
                  child: Form(
                    key: controller.formKey,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(30),
                          topRight: const Radius.circular(30),
                        ),
                      ),
                      height: Get.height * 0.9,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Text(
                                'Entrar',
                                style: GoogleFonts.archivo(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child: Text(
                                'Utilize seu email e senha para entrar.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, right: 15),
                              child: TextFormField(
                                controller: controller.logincontroller,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
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
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, right: 15),
                              child: TextFormField(
                                controller: controller.passworddcontroller,
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Senha obrigatoria';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, right: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed('register');
                                },
                                child: Row(
                                  children: const [
                                    Text(
                                      'Cadastrar-se',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.deepPurple,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 45, top: 100, right: 15),
                              width: Get.width * 0.9,
                              child: FloatingActionButton.extended(
                                onPressed: controller.setLogin,
                                elevation: 2,
                                backgroundColor: Colors.deepPurple,
                                label: const Text('Entrar'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                isScrollControlled: true,
              );
            },
          ),
        ),
      ),
    );
  }
}
