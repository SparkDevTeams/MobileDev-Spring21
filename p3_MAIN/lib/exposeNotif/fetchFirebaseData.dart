import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> checkDoc(String docId) async {
  try {
    var collectionReference =
        FirebaseFirestore.instance.collection("exposed_id");
    var document = await collectionReference.doc(docId).get();
    return document.exists;
  } catch (e) {
    throw e;
  }
}
