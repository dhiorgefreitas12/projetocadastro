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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage(
                'assets/imagens/beautiful.jpg',
              ),
            ),
          ),
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
                  Container(
                    height: 1100,
                    color: Colors.white,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
