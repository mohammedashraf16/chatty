import 'package:chatty/features/auth/data/model/my_user.dart';
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
  static Future<void> registerUser(MyUser user)async{
   return getUserCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUser(String userId)async{
    var documentSnapshot =await getUserCollection().doc(userId).get();
    return documentSnapshot.data();
  }
}
