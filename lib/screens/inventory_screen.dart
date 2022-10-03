import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_app/screens/dashboard_screen.dart';
import 'package:e_commerce_admin_app/utility/inventory_%20manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constants/colors_constants.dart';
import '../widgets/texts/bold_text.dart';
import '../widgets/texts/subheader_text.dart';
import 'edit_items_screen.dart';

class InventoryScreen extends StatelessWidget {
  InventoryScreen({super.key});
  final controller = Get.put(InventoryManager());
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Get.off(
                    const DashBoard(),
                  ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kSkeletonColor,
              )),
          centerTitle: true,
          backgroundColor: klightColor,
          title: const SubHeaderText(text: 'Inventory'),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream:
                FirebaseFirestore.instance.collection('Products').snapshots(),
            builder: (context, AsyncSnapshot snapshot) {
              controller.fetchInventoryProducts(
                  snapshot, const CircularProgressIndicator());
              return ListView.builder(
                itemCount: controller.inventoryProducts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Get.off(() => EditItemScreen(
                        name: controller.inventoryProducts[index]
                            ['productName'],
                        price: controller.inventoryProducts[index]
                            ['productPrice'],
                        category: controller.inventoryProducts[index]
                            ['productCategory'],
                        images: controller.inventoryProducts[index]
                            ['productImages'],
                      )),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                            controller.inventoryProducts[index]['productImage']
                                [0],
                          ),
                        ),
                        BoldText(
                            text: controller.inventoryProducts[index]
                                ['productName']),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Text(
                              '${controller.inventoryProducts[index]['productCount']}'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
}
