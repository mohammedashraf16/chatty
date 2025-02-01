import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key,
    this.onChanged,
    required this.fieldName,
    required this.hintText,
    this.validator,
    this.maxLines = 1,
    this.obscureText = false, this.border, this.controller});

  final void Function(String)? onChanged;
  final String fieldName;
  final String hintText;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final InputBorder? border;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller,
      maxLines: maxLines,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(4),
        border: border,
        hintText: hintText,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
