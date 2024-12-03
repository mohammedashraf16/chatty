import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      this.onChanged,
      required this.fieldName,
      required this.hintText,
      this.validator});

  final void Function(String)? onChanged;
  final String fieldName;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
