import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? email;
  String? cep;
  String? number;
  String? district;
  String? road;
  String? city;
  String? sstate;

  UserModel(
      {this.name,
      this.email,
      this.cep,
      this.number,
      this.district,
      this.road,
      this.city,
      this.sstate});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    cep = json['cep'];
    number = json['number'];
    district = json['district'];
    road = json['road'];
    city = json['city'];
    sstate = json['sstate'];
  }

  UserModel.fromFirebase(DocumentSnapshot<Map<String, dynamic>> data) {
    name = data.data()!['name'];
    email = data.data()!['email'];
    cep = data.data()!['cep'];
    number = data.data()!['number'];
    district = data.data()!['distric'];
    road = data.data()!['road'];
    city = data.data()!['city'];
    sstate = data.data()!['sstate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['cep'] = cep;
    data['number'] = number;
    data['district'] = district;
    data['road'] = road;
    data['city'] = city;
    data['sstate'] = sstate;

    return data;
  }
}
