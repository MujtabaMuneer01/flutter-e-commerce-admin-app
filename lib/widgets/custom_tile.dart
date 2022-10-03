import 'package:e_commerce_admin_app/widgets/texts/bold_text.dart';
import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';

class CustomTile extends StatelessWidget {
  String prefixText;
  List list;
  int index;
  CustomTile(
      {super.key,
      required this.index,
      required this.list,
      this.prefixText = 'New'});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                      text:
                          '$prefixText order from ${list[index]['clientName']}'),
                  Text(
                    '${list[index]['productsInCart']} Products ordered',
                    style: const TextStyle(
                        color: kSkeletonColor, fontFamily: 'Poppins'),
                  ),
                  Text(
                    'Total : ${list[index]['total']}\$',
                    style: const TextStyle(
                        fontSize: 14, fontFamily: 'Poppins', color: kMainColor),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded),
          ],
        ),
      );
}
