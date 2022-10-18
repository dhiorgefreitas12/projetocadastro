import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/app/models/user_model.dart';
import 'package:get/get.dart';

class AuthRepository extends GetConnect {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> setRegister(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebase.collection('users').doc(email).set({
        'email': email,
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
    await auth.signInWithEmailAndPassword(email: email, password: password);
    var data = await firebase.collection('users').doc(email).get();
    UserModel user = UserModel.fromFirebase(data);
    return user;
  }
}
