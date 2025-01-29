import 'dart:async';
import 'package:chatty/core/functions/email_validation.dart';
import 'package:chatty/core/widgets/custom_btn.dart';
import 'package:chatty/core/widgets/custom_text_form_field.dart';
import 'package:chatty/features/auth/data/model/my_user.dart';
import 'package:chatty/features/auth/presentation/provider/user_provider.dart';
import 'package:chatty/features/auth/presentation/sign_in/manager/sign_in_navigator.dart';
import 'package:chatty/features/auth/presentation/sign_in/manager/sign_in_view_model.dart';
import 'package:chatty/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:chatty/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chatty/core/utils/loading_functions.dart' as Utils;
import 'package:provider/provider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody>
    implements SignInNavigator {
  String email = "";

  String password = "";

  var formKey = GlobalKey<FormState>();
  SignInViewModel viewModel = SignInViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .28,
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
              Text(
                "Email",
                style: GoogleFonts.poppins(color: const Color(0xFF797979)),
              ),
              CustomTextFormField(
                validator: emailValidation,
                hintText: "Enter Your Email",
                fieldName: "Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              const SizedBox(
                height: 36,
              ),
              Text("password",
                  style: GoogleFonts.poppins(color: const Color(0xFF797979))),
              CustomTextFormField(
                obscureText: true,
                validator: (text) {
                  if (text == null || text
                      .trim()
                      .isEmpty) {
                    return 'Please Enter Your Password';
                  }
                  if (text.length < 6) {
                    return 'Password must be at least 6 characters long';
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
                onPressed: () {
                  validateForm();
                },
                text: "Login",
              ),
              const SizedBox(height: 35),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, SignUpView.routeName);
                },
                child: Text(
                  "Or Create My Account",
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF505050), fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validateForm() {
    if (formKey.currentState?.validate() == true) {
      viewModel.signInWithEmailAndPassword(email, password);
    }
  }

  @override
  void hideLoading() {
    Utils.hideLoading(context);
  }

  @override
  void showLoading() {
    Utils.showLoading(context, "Loading...");
  }

  @override
  void showMessage(String message) {
    Utils.showMessage(context, message, "OK", (context) {
      Navigator.pop(context);
    });
  }

  @override
  void navigateToHome(MyUser user) {
    var userProvider = Provider.of<UserProvider>(context,listen: false);
    userProvider.user=user;
      Timer(const Duration(seconds: 1),() {
        Navigator.of(context).pushReplacementNamed(HomeView.routeName);
      },);
  }
}
