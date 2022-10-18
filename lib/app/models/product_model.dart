import 'package:cloud_firestore/cloud_firestore.dart';

class productModel {
  String? id;
  String? name;
  String? price;
  String? inventory;

  productModel({this.name, this.price, this.inventory, this.id});

  productModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    inventory = json['inventory'];
  }

  productModel.fromFirebase(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    id = data.id;
    name = data.data()['name'];
    price = data.data()['price'];
    inventory = data.data()['inventory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['inventory'] = this.inventory;
    return data;
  }
}
