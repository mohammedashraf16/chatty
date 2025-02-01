import 'package:chatty/core/utils/database_utils.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:chatty/features/home/add_room/presentation/manager/add_room_navigator.dart';
import 'package:flutter/material.dart';

class AddRoomViewModel extends ChangeNotifier {
  late AddRoomNavigator navigator;

  void addRoom(
      String roomTitle, String roomDescription, String categoryId) async {
    Room room = Room(
      title: roomTitle,
      description: roomDescription,
      categoryId: categoryId,
      roomId: "",
    );
    try {
      navigator.showLoading();
      var createdRoom = await DatabaseUtils.addRoomToFireStore(room);
      navigator.hideLoading();
      navigator.showMessage("Room created successfully");
      navigator.navigateToHome();
    } catch (e) {
      navigator.hideLoading();
      navigator.showMessage(e.toString());
    }
  }
}
