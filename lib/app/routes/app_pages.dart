import 'package:flutter_application_1/app/home/edit_product/edit_product_page.dart';
import 'package:flutter_application_1/app/login/login_page.dart';
import 'package:get/get.dart';

import '../home/edit_users/edit_user_binding.dart';
import '../home/edit_users/edit_user_page.dart';
import '../home/home_binding.dart';
import '../home/home_page.dart';
import '../home/new_product/new_product_bindings.dart';
import '../home/new_product/new_product_page.dart';
import '../login/login_binding.dart';
import '../login/register/register_bindings.dart';
import '../login/register/register_page.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.NEWPRODUCT,
      page: () => const NewProductPage(),
      binding: NewProductBinding(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterPage(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: Routes.EDITUSER,
      page: () => const EditUserPage(),
      binding: EditUserBindings(),
    )
  ];
}
