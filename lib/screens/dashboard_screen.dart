import 'package:e_commerce_admin_app/screens/inventory_screen.dart';
import 'package:e_commerce_admin_app/screens/neworders_screen.dart';
import 'package:e_commerce_admin_app/screens/topselling_screen.dart';
import 'package:e_commerce_admin_app/constants/screens_id_constants.dart';
import 'package:e_commerce_admin_app/widgets/texts/bold_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../constants/colors_constants.dart';
import '../widgets/custom_divider.dart';
import 'add_item_screen.dart';
import 'completed_orders.dart';

class DashBoard extends StatelessWidget {
  static const id = ScreenID.adminDashboard;
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Orders
            //Title
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: const Text(
                'Orders',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
            //NewOrders
            GestureDetector(
              onTap: () => Get.off(NewOrders()),
              child: const ListTile(
                contentPadding: EdgeInsets.only(left: 64, right: 32),
                leading: Icon(
                  Icons.notifications,
                  color: kMainColor,
                ),
                title: BoldText(text: 'New orders'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            CustomDivider(
              leftMargin: 110,
            ),
            //Completed Orders
            GestureDetector(
              onTap: () => Get.off(CompletedOrders()),
              child: const ListTile(
                contentPadding: EdgeInsets.only(left: 64, right: 32),
                leading: Icon(
                  Icons.task_rounded,
                  color: kMainColor,
                ),
                title: BoldText(text: 'Completed orders'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            CustomDivider(
              leftMargin: 110,
            ),
            const SizedBox(
              height: 32,
            ),

            ///Inventory
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: const Text(
                'Inventory',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
            GestureDetector(
              onTap: () => Get.off(AddItemScreen()),
              child: const ListTile(
                contentPadding: EdgeInsets.only(left: 64, right: 32),
                leading: Icon(
                  Icons.dashboard_customize_outlined,
                  color: kMainColor,
                ),
                title: BoldText(text: 'Add to Inventory'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            CustomDivider(
              leftMargin: 110,
            ),
            GestureDetector(
              onTap: () => Get.off(InventoryScreen()),
              child: const ListTile(
                contentPadding: EdgeInsets.only(left: 64, right: 32),
                leading: Icon(
                  Icons.grid_view,
                  color: kMainColor,
                ),
                title: BoldText(text: 'View Inventory'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
            CustomDivider(
              leftMargin: 110,
            ),

            ///Statistics
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: const Text(
                'Statistics',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
            ),
            GestureDetector(
              onTap: () => Get.off(() => TopSelling()),
              child: const ListTile(
                contentPadding: EdgeInsets.only(left: 64, right: 32),
                leading: Icon(
                  Icons.dashboard_customize_outlined,
                  color: kMainColor,
                ),
                title: BoldText(text: 'Top Selling'),
                trailing: Icon(Icons.arrow_forward_ios_rounded),
              ),
            ),
          ],
        ),
      );
}
