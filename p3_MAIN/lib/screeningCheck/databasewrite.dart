import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SendDateTime {
  final String authID;
  SendDateTime({this.authID});

  final CollectionReference datesCollection =
      FirebaseFirestore.instance.collection('screening_checklist');

  Future sendDateTimeData({String dateTime}) async {
    return await datesCollection
        .doc(authID)
        .set({"last_filled_checklist": dateTime});
  }
}
