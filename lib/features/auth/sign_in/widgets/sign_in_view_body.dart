import 'package:chatty/core/functions/email_validation.dart';
import 'package:chatty/core/widgets/custom_btn.dart';
import 'package:chatty/core/widgets/custom_text_form_field.dart';
import 'package:chatty/features/auth/sign_up/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInViewBody extends StatelessWidget {
  SignInViewBody({super.key});

  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .28,
              ),
              Text(
                "Welcome back!",
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 36,
              ),
               Text("Email",style: GoogleFonts.poppins(
                   color: const Color(0xFF797979)
               ),),
              CustomTextFormField(
                validator: emailValidation,
                hintText: "Enter Your Email",
                fieldName: "Email",
                onChanged: (value) {
                  userName = value;
                },
              ),
              const SizedBox(
                height: 36,
              ),
               Text("password",style: GoogleFonts.poppins(
                  color: const Color(0xFF797979)
              )),
              CustomTextFormField(
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please Enter Your Password';
                  }
                  return null;
                },
                fieldName: "Password",
                hintText: "Enter Your Password",
                onChanged: (value) {
                  password = value;
                },
              ),
              const SizedBox(height: 30),
              GestureDetector(
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              CustomBtn(
                textColor: Colors.white,
                bgColor: const Color(0xFF3598DB),
                iconColor: Colors.white,
                onPressed: () {},
                text: "Login",
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                child: Text("Or Create My Account",style: GoogleFonts.poppins(
                  color: const Color(0xFF505050),
                  fontSize: 16
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
