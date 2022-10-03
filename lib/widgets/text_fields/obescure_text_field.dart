// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../constants/colors_constants.dart';

class ObsecureTextField extends StatelessWidget {
  final String? Function(String?) function;
  final Function() iconFunction;

  bool obescure, autofocus;
  ObsecureTextField(
      {super.key,
      this.autofocus = false,
      required this.function,
      required this.iconFunction,
      required this.obescure});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          Expanded(
            child: TextFormField(
              obscureText: obescure,
              validator: function,
              autofocus: autofocus,
              cursorColor: kMainColor,
              decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: iconFunction,
                      child: obescure
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility)),
                  focusColor: kMainColor,
                  hintText: 'Password'),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
        ],
      );
}
///{LIST}: 
//Products
///order name
///count count
///price
///image
//Client Info
///Client Name
///shipping details
/// phone
/// Total of order