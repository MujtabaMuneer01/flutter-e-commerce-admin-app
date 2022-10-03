import 'package:e_commerce_admin_app/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() function;
  const CustomOutlinedButton(
      {super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: OutlinedButton(
              onPressed: function,
              child: BodyText(
                text: text,
                textColor: kMainColor,
              ),
            ),
          ),
          const SizedBox(
            width: 32,
          )
        ],
      );
}
