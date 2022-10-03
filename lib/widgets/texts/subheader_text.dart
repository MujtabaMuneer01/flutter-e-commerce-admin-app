import 'package:flutter/material.dart';

class SubHeaderText extends StatelessWidget {
  final Color textColor;
  final String text;
  const SubHeaderText(
      {super.key, required this.text, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) => Text(
        text,
        style: TextStyle(fontFamily: 'Poppins', color: textColor, fontSize: 19),
      );
}
