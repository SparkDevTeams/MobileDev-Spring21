import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/loginScreen.dart';
import 'package:p3_MAIN/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:p3_MAIN/theme/themeData.dart';

class SettingsPage extends StatefulWidget {
  final String firstname, lastname;
  const SettingsPage({Key key, this.firstname, this.lastname})
      : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _faceIdValue = false;

  void nullReturn() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;

    final firstname = widget.firstname;
    final lastname = widget.lastname;

    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back,
                color: AppTheme.Colors.blueFIU, size: 35),
            onPressed: () {
              Navigator.pop(context);
            }, // TODO: Go back to homepage functionality
          )),
      body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Text(
              "Settings and\nPreferences",
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              width: 400,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: Colors.amber),
              child: Text("Logged in as: $firstname $lastname"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Select Language:",
              style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
            Row(
              children: <Widget>[
                RoundedButtons(
                    "English",
                    17.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn),
                SizedBox(width: 30),
                RoundedButtons(
                    "Spanish",
                    17.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn),
                SizedBox(width: 30),
                RoundedButtons(
                    "Creole",
                    17.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn)
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return CheckboxListTile(
                  activeColor: AppTheme.Colors.blueFIU,
                  value: _faceIdValue,
                  onChanged: (bool value) {
                    setState(() {
                      _faceIdValue = value;
                      print(user.uid);
                    });
                  },
                  title: Text(
                    "Face ID",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Notifications &\nPreferences:",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 10),
            Text(
              "Notify Instructors?",
              style: new TextStyle(
                  fontSize: 22, decoration: TextDecoration.underline),
            ),
            Text(
              "* The COVID Response Team will only notify instructors if the student has recieved a RED on their safety screening. It is the student’s responsibilility to follow up with the instructor regardless of screening outcome.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Row(
              children: [
                RoundedButtons(
                    "On",
                    18.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn),
                SizedBox(width: 40),
                RoundedButtons(
                    "Off",
                    18.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn)
              ],
            ),
            SizedBox(height: 10),
            Text(
              "Get Screening\nReminders?",
              style: new TextStyle(
                  fontSize: 20, decoration: TextDecoration.underline),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                RoundedButtons(
                    "On",
                    18.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn),
                SizedBox(width: 40),
                RoundedButtons(
                    "Off",
                    18.0,
                    50.0,
                    100.0,
                    Color.fromRGBO(224, 224, 224, 1.0),
                    Colors.black,
                    30.0,
                    nullReturn)
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: RaisedButton(
                  color: Color.fromRGBO(8, 30, 63, 1.0),
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () async {
                    print(FirebaseAuth.instance.currentUser);
                    await FirebaseAuth.instance.signOut();
                    print("Signed user out.");
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  }),
            ),
            SizedBox(
              height: 40,
            )
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    );
  }
}
