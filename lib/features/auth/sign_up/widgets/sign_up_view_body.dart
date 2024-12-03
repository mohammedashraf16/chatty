import 'package:chatty/core/functions/email_validation.dart';
import 'package:chatty/core/widgets/custom_btn.dart';
import 'package:chatty/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  String firstName = "";
  String lastName = "";
  String userName = "";
  String email = "";
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
                height: MediaQuery.of(context).size.height * .32,
              ),
              Text("First name",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return 'Please Enter Your First Name';
                  }
                  return null;
                },
                fieldName: "First Name",
                hintText: "first name",
                onChanged: (value) {
                  firstName = value;
                },
              ),
              const SizedBox(height: 30),
              Text("Last name",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Your Last Name';
                    }
                    return null;
                  },
                  fieldName: "Last Name",
                  hintText: "last name",
                  onChanged: (value) {
                    lastName = value;
                  }),
              const SizedBox(height: 30),
              Text("User name",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Your User Name';
                    }
                    return null;
                  },
                  fieldName: "User Name",
                  hintText: "user name",
                  onChanged: (value) {
                    userName = value;
                  }),
              const SizedBox(height: 30),
              Text("Email",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                validator: emailValidation,
                  fieldName: "Email",
                  hintText: "email",
                  onChanged: (value) {
                    email = value;
                  }),
              const SizedBox(height: 30),
              Text("Password",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please Enter Your Password';
                    }
                    if(text.length<6){
                      return 'Password should be at least 6 characters long';
                    }
                    return null;
                  },
                  fieldName: "Password",
                  hintText: "password",
                  onChanged: (value) {
                    password = value;
                  }),
              const SizedBox(height: 30),
              CustomBtn(
                onPressed: () {},
                text: "Create Account",
                bgColor: Colors.white,
                iconColor: const Color(0xFFBDBDBD),
                textColor: const Color(0xFFBDBDBD),
                elevation: 8,
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
