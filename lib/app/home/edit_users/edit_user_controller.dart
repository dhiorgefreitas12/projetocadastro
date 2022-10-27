import 'package:get/state_manager.dart';

import '../../app_controller.dart';
import '../../auth/auth_controller.dart';

class EditUserController extends GetxController {
  AppController appController;
  AuthController authController;
  EditUserController(this.appController, this.authController);
}
