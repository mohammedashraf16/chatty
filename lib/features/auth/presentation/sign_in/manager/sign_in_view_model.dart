import 'package:chatty/core/utils/firebase_errors.dart';
import 'package:chatty/features/auth/data/database_utils.dart';
import 'package:chatty/features/auth/presentation/sign_in/manager/sign_in_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  late SignInNavigator navigator;

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      // show loading indicator
      navigator.showLoading();
      final result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      navigator.hideLoading();
      navigator.showMessage("Sign In Success");

      var userObj = await DatabaseUtils.getUser(result.user?.uid ?? "");
      if (userObj == null) {
        navigator.hideLoading();
        navigator.showMessage("Register failed please try again");
      }else{
        navigator.navigateToHome(userObj);
      }
      // hide loading indicator

      // show message

    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.userNotFound) {
        print('No user found for that email.');
        // hide loading indicator
        navigator.hideLoading();
        // show message
        navigator.showMessage("No user found for that email.");
      } else if (e.code == FirebaseErrors.wrongPassword) {
        print('Wrong password provided for that user.');
        // hide loading indicator
        navigator.hideLoading();
        // show message
        navigator.showMessage("Wrong password provided for that user.");
      } else if (e.code == FirebaseErrors.invalidCredential) {
        // hide loading indicator
        navigator.hideLoading();
        // show message
        navigator.showMessage("Invalid email or password");
      }
    }
  }
}
