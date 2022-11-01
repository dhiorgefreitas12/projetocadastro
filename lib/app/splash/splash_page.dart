import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/app/splash/splash_controller.dart';
import 'package:get/state_manager.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

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
            onPressed: () {
              Get.toNamed('/login');
            },
            backgroundColor: Colors.deepPurple,
            label: const Text('Entrar'),
          ),
        ),
      ),
    );
  }
}
