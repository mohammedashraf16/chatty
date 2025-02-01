import 'package:chatty/features/chat/presentation/views/widgets/chat_view_body.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatView extends StatelessWidget {
  static const String routName = "chat_view";

  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Room;
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
              "The ${args.title} Zone",
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_rounded)),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: const ChatViewBody(),
        ),
      ],
    );
  }
}
