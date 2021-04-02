import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // collection reference

  final String authID;
  DatabaseService({this.authID});

  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('user_info');

  Future updateUserData(
      String email,
      String firstname,
      String lastname,
      String exposureID,
      String dateTimeLastCheck,
      String lastExposureDate) async {
    return await userDataCollection.doc(authID).set({
      'email': email,
      'first_name': firstname,
      'lastname': lastname,
      'exposure_id': exposureID,
      'last_filled_checklist': dateTimeLastCheck,
      'last_exposure_date': lastExposureDate
    });
  }

  // INPUT FOR FUNCTION BELOW IS A LIST OF STRINGS OF DOC IDS READ FROM MEMORY
  Future scanExposedDoc() {}
}
