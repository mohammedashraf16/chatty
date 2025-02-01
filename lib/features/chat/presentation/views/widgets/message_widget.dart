import 'package:chatty/features/auth/presentation/provider/user_provider.dart';
import 'package:chatty/features/chat/data/model/message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({super.key, required this.message});

  Message message;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return provider.user?.id == message.senderId
        ? SentMessage(message: message)
        : ReceiveMessage(message: message);
  }
}

class SentMessage extends StatelessWidget {
  SentMessage({super.key, required this.message});

  Message message;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(message.dateTime);

    String formattedDate =
    DateFormat('hh:mm a').format(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            color: Color(0xFF3598DB),
          ),
          child: Text(
            message.content,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: [
            Text(
              textAlign: TextAlign.start,
             formattedDate,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}

class ReceiveMessage extends StatelessWidget {
  ReceiveMessage({super.key, required this.message});

  Message message;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(message.dateTime);

    String formattedDate =
    DateFormat('hh:mm a').format(dateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              textAlign: TextAlign.end,
              formattedDate,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            color: Color(0xFFF8F8F8),
          ),
          child: Text(
            message.content,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
