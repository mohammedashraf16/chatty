import 'package:chatty/features/home/add_room/presentation/views/add_room.dart';
import 'package:chatty/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = "home";

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
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color(0xFF3598DB),
            shape: const CircleBorder(),
            onPressed: () {
              Navigator.of(context).pushNamed(AddRoom.routeName);
            },
            child:  const Icon(Icons.add,color: Colors.white,size: 30),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "Chat App",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: const HomeViewBody(),
        ),
      ],
    );
  }
}
