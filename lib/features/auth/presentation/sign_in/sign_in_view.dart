import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  static const routeName = "sign_in_view";

  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              "Login",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body:  SignInViewBody(),
        ),
      ],
    );
  }
}
