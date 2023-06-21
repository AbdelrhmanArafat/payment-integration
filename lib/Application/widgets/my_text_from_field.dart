import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextFromField extends StatelessWidget {
  TextEditingController controller;
  TextInputType type;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  GestureTapCallback? onTap;
  bool isPassword;
  FormFieldValidator<String>? validator;
  String label;
  IconData? suffix;
  IconData prefix;
  VoidCallback? suffixPressed;
  bool isClickable;
  int? lines;

  MyTextFromField({
    Key? key,
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    required this.validator,
    required this.label,
    this.suffix,
    required this.prefix,
    this.suffixPressed,
    this.isClickable = true,
    this.lines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      maxLines: lines,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefix: Icon(prefix),
        suffix: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
