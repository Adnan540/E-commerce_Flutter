import 'package:flutter/material.dart';


class TextForm extends StatelessWidget {
  TextForm({
    required this.controller,
    required this.hintText,
    this.suffixicon,
    required this.validator
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? suffixicon;
  final String? Function(String?)validator;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator:validator,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon:suffixicon,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54,
              width: 2
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black54,
              width: 2
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
