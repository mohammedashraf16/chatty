import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.onChanged, required this.fieldName, required this.hintText});
final void Function(String)? onChanged;
final String fieldName;
final String hintText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      onChanged: onChanged,
      validator:(text) {
        if(text==null||text.trim().isEmpty){
          return 'Please Enter Your $fieldName';
        }
        return null;
      },
    );
  }
}
