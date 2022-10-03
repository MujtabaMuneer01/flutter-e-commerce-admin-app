// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class CustomTextField extends StatelessWidget {
  final bool isDecorated;
  final String hint;
  final TextInputType? keyboardType;
  final String? Function(String?)? validatorFunction;
  TextEditingController? textController;
  final Function(String) function;
  bool autofocus;
  CustomTextField(
      {super.key,
      this.textController,
      this.validatorFunction,
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
            child: TextFormField(
              controller: textController,
              onChanged: function,
              validator: validatorFunction,
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
