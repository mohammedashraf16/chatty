import 'package:chatty/features/chat/presentation/views/chat_view.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomWidget extends StatelessWidget {
  Room room;

  RoomWidget({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(ChatView.routName,arguments: room);
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Column(
          spacing: 10,
          children: [
            Image.asset(
              height: 90,
              fit: BoxFit.fill,
              "assets/images/${room.categoryId}.png",
            ),
            Text(
              room.title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
