import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AdminOrdersManager extends GetxController {
  var orderedProducts = [].obs;
  var completedOrderedProducts = [].obs;
  void addToCompletedOrders(Map<String, dynamic> order) {
    ///for example only: pass a dictionary to the parameter as shown below:
    /*{
      'clientName': orderedProducts[index]
          ['clientName'],
      'date': orderedProducts[index]
          ['date'],
      'products': orderedProducts[index]
          ['products'],
      'productsInCart':
          orderedProducts[index]
              ['productsInCart'],
      'total': orderedProducts[index]
          ['total'],
       }*/
    FirebaseFirestore.instance.collection('CompletedOrders').add(order);
  }
  fetchNewOrders(AsyncSnapshot snapshot, Widget loadingScreenWidget) {
    if (!snapshot.hasData) {
      return SizedBox(height: 10.0, width: 10.0, child: loadingScreenWidget);
    }
    List newOrders = snapshot.data!.docs;
    for (var order in newOrders) {
      orderedProducts.add(order);
    }
  }
  fetchCompletedOrders(AsyncSnapshot snapshot, Widget loadingScreenWidget) {
    if (!snapshot.hasData) {
      return SizedBox(height: 10.0, width: 10.0, child: loadingScreenWidget);
    }
    List completedOrders = snapshot.data!.docs;
    for (var order in completedOrders) {
      completedOrderedProducts.add(order);
    }
  }
}
