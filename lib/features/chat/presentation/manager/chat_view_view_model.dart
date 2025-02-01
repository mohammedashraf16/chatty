import 'package:chatty/core/utils/database_utils.dart';
import 'package:chatty/features/auth/data/model/my_user.dart';
import 'package:chatty/features/chat/data/model/message.dart';
import 'package:chatty/features/chat/presentation/manager/chat_navigator.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatViewViewModel extends ChangeNotifier {
  late ChatNavigator navigator;
  late Room room;
  late MyUser currentUser;
late Stream<QuerySnapshot<Message>> streamMessage;
  void sendMessage(String content) async {
    Message message = Message(
      roomId: room.roomId,
      content: content,
      senderId: currentUser.id,
      senderName: currentUser.username,
      dateTime: DateTime.now().millisecondsSinceEpoch,
    );
    try {
      var result = await DatabaseUtils.insertMessage(message);
      navigator.clearMessage();
    } catch (e) {
      navigator.showMessage(e.toString());
    }
  }
  void listenToMessageFromFirestore(){
    streamMessage = DatabaseUtils.getMessagesFromFirestore(room.roomId);
  }
}
