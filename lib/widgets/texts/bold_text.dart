import 'package:flutter/material.dart';

class BoldText extends StatelessWidget {
  final Color textColor;
  final String text;
  const BoldText(
      {super.key, required this.text, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(
            fontFamily: 'Poppins',
            color: textColor,
            fontSize: 15,
            fontWeight: FontWeight.bold),
      );
}
