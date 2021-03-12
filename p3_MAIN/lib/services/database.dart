import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference

  final String authID;
  DatabaseService({this.authID});

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('user_info');

  Future updateUserData(
      String exposureID, String firstname, String lastname) async {
    return await userDataCollection.doc(authID).set({
      'exposure_id': exposureID,
      'first_name': firstname,
      'lastname': lastname
    });
  }
}
