import 'package:chatty/core/utils/firebase_errors.dart';
import 'package:chatty/core/utils/database_utils.dart';
import 'package:chatty/features/auth/data/model/my_user.dart';
import 'package:chatty/features/auth/presentation/sign_up/manager/sign_up_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  late RegisterNavigator navigator;

  Future<void> createUserWithEmailAndPassword(String email, String password,
      String firstName, String lastName, String username, ) async {
    try {
      navigator.showLoading();
      // show loading indicator
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var user = MyUser(id: result.user?.uid ?? "",
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: email);
     var dataUser = await DatabaseUtils.registerUser(user);      // hide loading indicator
      navigator.hideLoading();
      // show message
      navigator.showMessage("Account Created Successfully");
      navigator.navigateToHome(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        // hide loading
        navigator.hideLoading();
        // show error message
        navigator.showMessage("The password provided is too weak.");
      } else if (e.code == FirebaseErrors.emailAlreadyInUse) {
        // hide loading
        navigator.hideLoading();
        // show error message
        navigator.showMessage("The account already exists for that email.");
        print('The account already exists for that email.');
      }
    } catch (e) {
      // hide loading indicator
      navigator.hideLoading();
      // show error message
      navigator.showMessage("Failed to create account. Please try again.");
      print(e);
    }
  }
}