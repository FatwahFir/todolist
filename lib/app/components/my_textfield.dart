import 'package:flutter/material.dart';
import 'package:todo_list/app/core/extensions/context_extension.dart';

class MyTextfield extends StatelessWidget {
  const MyTextfield({
    super.key,
    required this.hintText,
    this.obscure = false,
    required this.controller,
    this.focusNode,
  });
  final String hintText;
  final bool obscure;
  final TextEditingController controller;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.tertiary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: context.primary,
            ),
          ),
          fillColor: context.secondary,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: context.primary),
        ),
      ),
    );
  }
}
