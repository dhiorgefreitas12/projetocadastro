import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/app/models/user_model.dart';
import 'package:get/get.dart';

import 'auth_repository.dart';

class AuthController extends GetxController {
  UserModel userLoged = UserModel();

  AuthRepository _authRepository;
  AuthController(this._authRepository);

  Future setRegister(String email, String password) async {
    userLoged = await _authRepository.setRegister(email, password);
  }

  Future setLogin(String email, String password) async {
    userLoged = await _authRepository.setLogin(email, password);
  }
}
