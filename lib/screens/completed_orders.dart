import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_app/screens/dashboard_screen.dart';
import 'package:e_commerce_admin_app/constants/screens_id_constants.dart';
import 'package:e_commerce_admin_app/widgets/custom_divider.dart';
import 'package:e_commerce_admin_app/widgets/texts/bold_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_constants.dart';

import '../utility/orders_manager.dart';
import '../widgets/custom_tile.dart';
import '../widgets/orders.dart';

class CompletedOrders extends StatelessWidget {
  static const id = ScreenID.adminNewOrders;
  final AdminOrdersManager controller = Get.put(AdminOrdersManager());

  CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            SliverAppBar.medium(
              leading: GestureDetector(
                onTap: () => Get.off(const DashBoard()),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: kMainColor,
                ),
              ),
              elevation: 0,
              backgroundColor: klightColor,
              centerTitle: true,
              title: const Text('Completed Orders'),
            )
          ],
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('CompletedOrders')
                .snapshots(),
            builder: (context, snapshot) {
              controller.fetchCompletedOrders(
                  snapshot, const CircularProgressIndicator());

              return ListView.separated(
                separatorBuilder: (context, index) => CustomDivider(),
                itemCount: controller.completedOrderedProducts.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //OrderInfo
                          Container(
                            margin: const EdgeInsets.only(bottom: 8, top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 32),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BoldText(
                                          text:
                                              'Completed order from ${controller.completedOrderedProducts[index]['clientName']}'),
                                      Text(
                                        '${controller.completedOrderedProducts[index]['productsInCart']} Products ordered',
                                        style: const TextStyle(
                                            color: kSkeletonColor,
                                            fontFamily: 'Poppins'),
                                      ),
                                      Text(
                                        'Total : ${controller.completedOrderedProducts[index]['total']}\$',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Poppins',
                                            color: kMainColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CustomDivider(),
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                BoldText(
                                  text: 'Completed',
                                  textColor: Colors.green,
                                ),
                              ],
                            ),
                          ),

                          CustomDivider(),
                          Orders(
                            index: index,
                            list: controller.completedOrderedProducts,
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///Completed ORDERS
                  child: CustomTile(
                    index: index,
                    list: controller.completedOrderedProducts,
                    prefixText: 'Completed',
                  ),
                ),
              );
            },
          ),
        ),
      );
}
