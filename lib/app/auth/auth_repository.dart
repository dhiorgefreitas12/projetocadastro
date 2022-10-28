import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/models/user_model.dart';
import 'package:get/get.dart';

class AuthRepository extends GetConnect {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> setRegister(
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
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      firebase.collection('users').doc(email).set({
        'name': name,
        'email': email,
        'cep': cep,
        'road': road,
        'number': number,
        'district': district,
        'city': city,
        'sstate': sstate,
      });
      var data = await firebase.collection('users').doc(email).get();
      UserModel user = UserModel.fromFirebase(data);
      return user;
    } catch (e) {
      print(e.toString());
      return UserModel();
    }
  }

  Future<UserModel> setLogin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      var data = await firebase.collection('users').doc(email).get();
      UserModel user = UserModel.fromFirebase(data);
      return user;
    } catch (e) {
      await Get.bottomSheet(Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16), topRight: Radius.circular(16))),
        height: Get.height * 0.25,
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.cancel,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Login ou senha incorreto!',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ));
      return UserModel();
    }
  }

  Future signOut() async {
    auth.signOut();
  }

  Future updateUser(UserModel userlogged) async {
    var data = await firebase.collection('users').doc(userlogged.email).get();
    UserModel user = UserModel.fromFirebase(data);
    return user;
  }
}
