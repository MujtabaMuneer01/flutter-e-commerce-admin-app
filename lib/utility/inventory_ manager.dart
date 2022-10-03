import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../models/product_model.dart';

class InventoryManager extends GetxController {
  var isEdited = true.obs;
  var productImages = [
    '',
    '',
    '',
    '',
  ].obs;
  var name = ''.obs, category = ''.obs;
  var price = 0.0.obs, count = 0.obs;
  var imageUploaded = false.obs;
  var productadded = false.obs;
  uploadImage(String? imageName) async {
    File imageFile;
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      await FirebaseStorage.instance
          .ref()
          .child('images/$imageName')
          .putFile(imageFile);
      imageUploaded.value = true;
    }
  }

  filterAddedImages(List newList) {
    for (var image in productImages) {
      if (image != '') {
        newList.add(image);
      }
    }
  }

  getImage(String? imageName, index) async {
    if (imageUploaded.value == true) {
      await FirebaseStorage.instance
          .ref()
          .child('images/$imageName')
          .getDownloadURL()
          .then((url) => productImages[index] = url);

      imageUploaded.value = false;
    }
  }

  var inventoryProducts = [].obs;
  fetchInventoryProducts(AsyncSnapshot snapshot, Widget loadingScreenWidget) {
    if (!snapshot.hasData) {
      return loadingScreenWidget;
    }
    List productsList = snapshot.data.docs;
    for (var product in productsList) {
      inventoryProducts.add(
        ProductModel(
          price: product['productPrice'],
          name: product['productName'],
          category: product['productCategory'],
          images: product['productImage'],
          count: product['productCount'],
        ).toMap(),
      );
    }
  }

  addNewProductToInventory(ProductModel productModel, String id) async {
    await FirebaseFirestore.instance
        .collection('Products')
        .doc(id)
        .set(productModel.toMap());
    productadded.value = true;
  }

  upadteProduct(ProductModel productModel, id) {
    FirebaseFirestore.instance.collection('Products').doc(id).delete();

    FirebaseFirestore.instance
        .collection('Products')
        .doc(id)
        .set(productModel.toMap());
    productadded.value = true;
  }
}
