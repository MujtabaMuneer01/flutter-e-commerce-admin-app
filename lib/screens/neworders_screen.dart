import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_admin_app/screens/dashboard_screen.dart';
import 'package:e_commerce_admin_app/utility/orders_manager.dart';
import 'package:e_commerce_admin_app/constants/screens_id_constants.dart';
import 'package:e_commerce_admin_app/models/order_model.dart';
import 'package:e_commerce_admin_app/widgets/custom_divider.dart';
import 'package:e_commerce_admin_app/widgets/texts/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_constants.dart';
import '../widgets/buttons/switch_button.dart';
import '../widgets/custom_tile.dart';
import '../widgets/orders.dart';

class NewOrders extends StatelessWidget {
  static const id = ScreenID.adminNewOrders;
  NewOrders({super.key});
  final AdminOrdersManager controller = Get.put(AdminOrdersManager());
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
              title: const Text('New Orders'),
            )
          ],
          body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('NewOrders').snapshots(),
            builder: (context, snapshot) {
              controller.fetchNewOrders(
                  snapshot, const CircularProgressIndicator());
              return ListView.separated(
                separatorBuilder: (context, index) => CustomDivider(),
                itemCount: controller.orderedProducts.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => (GestureDetector(
                  ///BottomSheet

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
                                              'New order from ${controller.orderedProducts[index]['clientName']}'),
                                      Text(
                                        '${controller.orderedProducts[index]['productsInCart']} Products ordered',
                                        style: const TextStyle(
                                            color: kSkeletonColor,
                                            fontFamily: 'Poppins'),
                                      ),
                                      Text(
                                        'Total : ${controller.orderedProducts[index]['total']}\$',
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

                          ///switch button
                          Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Mark as completed'),
                                SwitchButton(
                                  function: (_) {
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      controller.addToCompletedOrders(OrderModel(
                                              clientName: controller
                                                      .orderedProducts[index]
                                                  ['clientName'],
                                              date: controller
                                                      .orderedProducts[index]
                                                  ['date'],
                                              total: controller
                                                      .orderedProducts[index]
                                                  ['total'],
                                              productsInCart: controller
                                                      .orderedProducts[index]
                                                  ['productsInCart'],
                                              products:
                                                  controller.orderedProducts[index]
                                                      ['products'])
                                          .toMap());
                                      Navigator.pop(context);
                                    });
                                  },
                                )
                              ],
                            ),
                          ),

                          CustomDivider(),
                          Orders(
                            index: index,
                            list: controller.orderedProducts,
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///List of NewOrders
                  child: CustomTile(
                      index: index, list: controller.orderedProducts),
                )),
              );
            },
          ),
        ),
      );
}
