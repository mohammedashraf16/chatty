import 'package:chatty/features/auth/sign_up/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = "sign_up_view";
  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Image.asset(
          "assets/images/main_bg.png",
          fit: BoxFit.fill,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Create Account",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body:   SignUpViewBody(),
        ),
      ],
    );
  }
}
