import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference

  final String authID;
  DatabaseService({this.authID});

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('exposed_id');

  Future sendexposure({String exposureID}) async {
    return await userDataCollection
        .doc(authID)
        .set({"exposure_id": exposureID});
  }
}
