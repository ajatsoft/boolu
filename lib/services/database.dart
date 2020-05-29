import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:boolu/model/user.dart';

//CLASS FOR USERS
class DatabaseService {
  final String uid;
  DatabaseService({ this.uid, this.firestore});

  //collection reference 
  final CollectionReference userCollection = Firestore.instance.collection('users');
  final Firestore firestore;


 //update user collection
  Future updateUserData(String fullName, String email) async{
    return await userCollection.document(uid).setData({
      'fullName': fullName,      
      'email' : email,
    });
  }

//userdata from snapshot
UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {

  return UserData(
    fullName: snapshot.data['fullName'],
    email: snapshot.data['email'],
     
  );
}
  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }
}