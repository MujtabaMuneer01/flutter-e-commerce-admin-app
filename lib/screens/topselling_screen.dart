import 'package:e_commerce_admin_app/screens/dashboard_screen.dart';
import 'package:e_commerce_admin_app/utility/datetime_manager.dart';
import 'package:e_commerce_admin_app/widgets/texts/subheader_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors_constants.dart';

class TopSelling extends StatelessWidget {
  TopSelling({super.key});
  final controller = Get.put(DateTimeManager());
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
          title: const SubHeaderText(text: 'Top Selling'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      );
}
