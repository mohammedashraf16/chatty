import 'package:chatty/features/auth/data/model/my_user.dart';
import 'package:chatty/features/chat/data/model/message.dart';
import 'package:chatty/features/home/add_room/data/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseUtils {
  static CollectionReference<MyUser> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static CollectionReference<Room> getRoomCollection() {
    return FirebaseFirestore.instance
        .collection(Room.collectionName)
        .withConverter<Room>(
          fromFirestore: (snapshot, options) => Room.fromJson(snapshot.data()!),
          toFirestore: (room, options) => room.toJson(),
        );
  }

  static CollectionReference<Message> getMessageCollection(String roomId) {
    return FirebaseFirestore.instance
        .collection(Room.collectionName)
        .doc(roomId)
        .collection(Message.collectionName)
        .withConverter<Message>(
          fromFirestore: (snapshot, options) =>
              Message.fromJson(snapshot.data()!),
          toFirestore: (message, options) => message.toJson(),
        );
  }

  static Future<void> insertMessage(Message message) {
    var messageCollection = getMessageCollection(message.roomId);
    var docRef = messageCollection.doc();
    message.id = docRef.id;
    return docRef.set(message);
  }

  static Stream<QuerySnapshot<Message>> getMessagesFromFirestore(
      String roomId) {
    return getMessageCollection(roomId).orderBy("dateTime").snapshots();
  }

  static Future<void> addRoomToFireStore(Room room) {
    var documentRef = getRoomCollection().doc();
    room.roomId = documentRef.id;
    return documentRef.set(room);
  }

  static Stream<QuerySnapshot<Room>> getRoom() {
    return getRoomCollection().snapshots();
  }

  static Future<void> registerUser(MyUser user) async {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUser(String userId) async {
    var documentSnapshot = await getUserCollection().doc(userId).get();
    return documentSnapshot.data();
  }
}
