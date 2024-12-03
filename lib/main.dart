import 'package:chatty/features/splash/splash_view.dart';
import 'package:flutter/material.dart';

import 'features/auth/sign_in/sign_in_view.dart';
import 'features/auth/sign_up/sign_up_view.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        SignInView.routeName: (context) => const SignInView(),
        SignUpView.routeName: (context) => const SignUpView(),
      },
      initialRoute: SplashView.routeName,
    );
  }
}
