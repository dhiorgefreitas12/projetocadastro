import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/app/models/user_model.dart';
import 'package:get/get.dart';

import 'auth_repository.dart';

class AuthController extends GetxController {
  Rx<UserModel> userLoged = UserModel().obs;

  AuthRepository _authRepository;
  AuthController(this._authRepository);

  Future setRegister(
    String name,
    String email,
    String password,
    String cep,
    String road,
    String number,
    String district,
    String city,
    String sstate,
  ) async {
    userLoged.value = await _authRepository.setRegister(
        name, email, password, cep, road, number, district, city, sstate);
  }

  Future setLogin(String email, String password) async {
    userLoged.value = await _authRepository.setLogin(email, password);
  }

  Future signOut() async {
    userLoged.value = UserModel();
    _authRepository.signOut();
  }

  Future updateUser() async {
    userLoged.value = await _authRepository.updateUser(userLoged.value);
  }
}
