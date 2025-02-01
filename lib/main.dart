import 'package:chatty/features/auth/presentation/provider/user_provider.dart';
import 'package:chatty/features/auth/presentation/sign_in/sign_in_view.dart';
import 'package:chatty/features/auth/presentation/sign_up/sign_up_view.dart';
import 'package:chatty/features/chat/presentation/views/chat_view.dart';
import 'package:chatty/features/home/add_room/presentation/views/add_room.dart';
import 'package:chatty/features/home/presentation/views/home_view.dart';
import 'package:chatty/features/splash/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create:(context) => UserProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
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
        HomeView.routeName: (context) => const HomeView(),
        AddRoom.routeName: (context) => const AddRoom(),
        ChatView.routName: (context) => const ChatView(),
      },
      initialRoute: provider.firebaseUser==null? SignInView.routeName:HomeView.routeName,
    );
  }
}
