import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String? id;
  String? name;
  String? price;
  String? inventory;
  String? code;
  String? image;

  ProductModel({
    this.name,
    this.price,
    this.inventory,
    this.id,
    this.code,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    inventory = json['inventory'];
    code = json['code'];
    image = json['image'];
  }

  ProductModel.fromFirebase(QueryDocumentSnapshot<Map<String, dynamic>> data) {
    id = data.id;
    name = data.data()['name'];
    price = data.data()['price'];
    inventory = data.data()['inventory'];
    code = data.data()['code'];
    image = data.data()['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['inventory'] = this.inventory;
    data['code'] = this.code;
    data['image'] = this.image;
    return data;
  }
}
