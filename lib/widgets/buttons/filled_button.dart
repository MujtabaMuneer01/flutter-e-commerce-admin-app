import 'package:e_commerce_admin_app/widgets/texts/body_text.dart';
import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class FilledButton extends StatelessWidget {
  final String text;
  final Function() function;
  const FilledButton({super.key, required this.function, required this.text});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: MaterialButton(
              textColor: klightColor,
              color: kMainColor,
              onPressed: function,
              child: BodyText(
                text: text,
                textColor: klightColor,
              ),
            ),
          ),
          const SizedBox(
            width: 32,
          )
        ],
      );
}
