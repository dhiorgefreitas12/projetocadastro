import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../app_controller.dart';
import '../../auth/auth_controller.dart';

class NewProductController extends GetxController {
  AppController appController;
  AuthController authController;
  NewProductController(this.appController, this.authController);

  final FirebaseStorage storage = FirebaseStorage.instance;

  TextEditingController namecontroller = TextEditingController();

  TextEditingController pricecontroller = TextEditingController();

  TextEditingController codecontroller = TextEditingController();

  TextEditingController inventorycontroller = TextEditingController();

  RxString image = RxString('');

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<void> upload(String path) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().toString()}.jpg');
    final metadata = SettableMetadata(
        contentType: 'image/jpeg', customMetadata: {'picked-file-path': path});
    UploadTask uploadTask;
    if (GetPlatform.isWeb) {
      uploadTask = ref.putData(await File(path).readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(File(path), metadata);
    }
    await Future.value(uploadTask);
    final link = await ref.getDownloadURL();
    image.value = link;
    print(link);
  }

  pickAndUploadImage() async {
    XFile? file = await getImage();
    if (file != null) {
      await upload(file.path);
    }
  }
}
