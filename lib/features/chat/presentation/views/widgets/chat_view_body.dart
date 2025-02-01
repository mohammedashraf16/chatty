import 'package:chatty/core/widgets/custom_text_form_field.dart';
import 'package:chatty/features/auth/presentation/provider/user_provider.dart';
import 'package:chatty/features/chat/data/model/message.dart';
import 'package:chatty/features/chat/presentation/manager/chat_navigator.dart';
import 'package:chatty/features/chat/presentation/manager/chat_view_view_model.dart';
import 'package:chatty/features/chat/presentation/views/widgets/message_widget.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:chatty/core/utils/loading_functions.dart' as Utils;

class ChatViewBody extends StatefulWidget {
  const ChatViewBody({super.key});

  @override
  State<ChatViewBody> createState() => _ChatViewBodyState();
}

class _ChatViewBodyState extends State<ChatViewBody> implements ChatNavigator {
  ChatViewViewModel viewModel = ChatViewViewModel();
  TextEditingController controller = TextEditingController();
  String messageContent = "";

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Room;
    var provider = Provider.of<UserProvider>(context);
    viewModel.currentUser = provider.user!;
    viewModel.room = args;
    viewModel.listenToMessageFromFirestore();
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder<QuerySnapshot<Message>>(
                stream: viewModel.streamMessage,
                builder: (context, asyncSnapshot) {
                  if (asyncSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xFF3598DB),
                      ),
                    );
                  } else if (asyncSnapshot.hasError) {
                    return Center(child: Text(asyncSnapshot.error.toString()));
                  } else if (asyncSnapshot.connectionState ==
                      ConnectionState.none) {
                    return const Center(child: Text("No messages yet"));
                  } else {
                    var messageList = asyncSnapshot.data?.docs
                            .map((doc) => doc.data())
                            .toList() ??
                        [];
                    return ListView.builder(
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return MessageWidget(message: messageList[index]);
                      },
                    );
                  }
                },
              )),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CustomTextFormField(
                        controller: controller,
                        onChanged: (value) {
                          messageContent = value;
                        },
                        fieldName: "Chatting",
                        hintText: "Type a message",
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        )),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: const Color(0xFF3598DB)),
                      onPressed: () {
                        viewModel.sendMessage(messageContent);
                      },
                      child: Row(
                        children: [
                          Text(
                            "Send",
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            "assets/images/send.png",
                            height: 20,
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void showMessage(String message) {
    Utils.showMessage(context, message, "Ok", (context) {
      Navigator.pop(context);
    });
  }

  @override
  void clearMessage() {
    controller.clear();
  }
}
