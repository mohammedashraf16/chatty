import 'package:flutter/material.dart';

import 'widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  static const routeName = "sign_in_view";
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInViewBody(),
    );
  }
}
