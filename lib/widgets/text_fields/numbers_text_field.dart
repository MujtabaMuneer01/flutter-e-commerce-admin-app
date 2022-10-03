import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class NumbersTextField extends StatelessWidget {
  bool isDecorated;
  final String hint;
  final TextInputType? keyboardType;
  TextEditingController? textController;
  final Function(String) function;
  bool autofocus;
  NumbersTextField(
      {super.key,
      this.textController,
      this.isDecorated = true,
      this.autofocus = true,
      required this.function,
      this.keyboardType,
      required this.hint});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: TextField(
              controller: textController,
              onChanged: function,
              keyboardType: TextInputType.phone,
              autofocus: autofocus,
              cursorColor: kMainColor,
              decoration: isDecorated
                  ? InputDecoration(focusColor: kMainColor, hintText: hint)
                  : InputDecoration(
                      border: InputBorder.none,
                      focusColor: kMainColor,
                      hintText: hint),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
      );
}
