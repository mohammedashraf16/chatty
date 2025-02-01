import 'package:chatty/features/home/add_room/presentation/views/widgets/add_room_body.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddRoom extends StatelessWidget {
  static const String routeName = "addRoom";
  const AddRoom({super.key});

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
              "Add Room",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body:  const AddRoomBody(),
        ),
      ],
    );
  }
}
