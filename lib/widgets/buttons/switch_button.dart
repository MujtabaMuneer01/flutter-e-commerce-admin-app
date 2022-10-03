import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class SwitchButton extends StatefulWidget {
  void Function(TapDownDetails)? function;
  SwitchButton({super.key, required this.function});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool on = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown:  widget.function,
        onTap: () {
          if (on == false) {
            setState(() {
              on = true;
             
            });
          } else {
            setState(() {
              on = false;
            });
          }
        },
        child: Stack(children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 222),
            width: 80,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                color: on
                    ? Color.fromARGB(255, 70, 236, 76)
                    : const Color.fromARGB(132, 204, 204, 204)),
          ),
          AnimatedPositioned(
            right: on ? 7 : 42,
            top: 5,
            curve: Curves.easeOutCubic,
            duration: const Duration(milliseconds: 222),
            child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38))),
          )
        ]),
      );
}
