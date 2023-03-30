import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key, required this.controller, required this.hintText, required this.obscureText, required this.icon, required String? Function(dynamic value) validator, 
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
        ),
      );
  }
}