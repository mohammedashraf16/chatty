import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.bgColor,
      required this.iconColor, this.elevation, required this.textColor});

  final void Function()? onPressed;
  final String text;
  final Color textColor;
  final Color bgColor;
  final Color iconColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              elevation: elevation,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              )),
          onPressed: () {},
          child: Row(
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(fontSize: 16, color: textColor),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward,
                color: iconColor,
                size: 35,
              ),
            ],
          )),
    );
  }
}
