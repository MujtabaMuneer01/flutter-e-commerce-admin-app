import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double leftMargin;
  double rightMargin;
  CustomDivider({super.key, this.leftMargin = 32, this.rightMargin = 0});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(
            left: leftMargin, bottom: 8, top: 8, right: rightMargin),
        child: const Divider(
            color: Color.fromARGB(101, 158, 158, 158), height: 1, thickness: 1),
      );
}
