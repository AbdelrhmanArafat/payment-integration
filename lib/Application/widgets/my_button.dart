import 'package:flutter/material.dart';

import 'package:payment/Application/utils/color.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  double width;
  double height;
  VoidCallback onPressed;
  String text;
  bool isUpperCase;
  double radius;
  Color colorBackground;

  MyButton({
    Key? key,
    this.width = double.infinity,
    this.height = 50,
    required this.onPressed,
    required this.text,
    this.isUpperCase = true,
    this.radius = 0,
    this.colorBackground = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: colorBackground,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
