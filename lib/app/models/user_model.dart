import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? email;

  UserModel({this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
  }

  UserModel.fromFirebase(DocumentSnapshot<Map<String, dynamic>> data) {
    email = data.data()!['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    return data;
  }
}
