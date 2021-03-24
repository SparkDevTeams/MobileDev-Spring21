import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/loginScreen.dart';
import 'package:p3_MAIN/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


 
class SettingsPage extends StatelessWidget {
  final int pantherID = 1234567;

  void nullReturn() {
    return null;
  }

  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
        body: Padding(
        padding: const EdgeInsets.only(right: 25, left: 25),
        child: Column(children: <Widget>[
          Text(
            "Settings and\nPreferences",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
          ),
          Container(
            child: RoundedBox("Logged in as: $pantherID", Colors.white, 14.0,
                25.0, Color.fromRGBO(8, 30, 63, 1.0), 50.0, 200.0, Alignment.center),
          ),
          Text(
            "Select Language:",
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
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
          Row(children: [
             Text("Face ID:",
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize:25)
          ),
          SizedBox(width: 170),
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
        Row(children: [
          Text("Terms of Use:",
          style: new TextStyle(fontWeight: FontWeight.bold,fontSize:25)
          ),
          SizedBox(width: 100),
          RoundedButtons(
                  "Off",
                  18.0,
                  50.0,
                  100.0,
                  Color.fromRGBO(224, 224, 224, 1.0),
                  Colors.black,
                  30.0,
                  nullReturn),
        ],
        ),
          
          Text("Notifications &\nPreferences:",
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          SizedBox(height: 10),
          Text(
            "Notify Instructors?",
            style: new TextStyle(
                fontSize: 22, decoration: TextDecoration.underline),
          ),
          Text("* The COVID Response Team will only notify instructors if the student has recieved a RED on their safety screening. It is the student’s responsibilility to follow up with the instructor regardless of screening outcome.",
            style: new TextStyle(fontSize: 13),
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
              color:Color.fromRGBO(8, 30, 63, 1.0),
              child:Text(
                "Log Out",
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
          
                onPressed: signOut
                      
              )         
                        
          )
          
        ], crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );
  }
}
// Was messing around trying to have the user logout. It does not log out the user but has them 
//go back to the login page
 final _auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    print(FirebaseAuth.instance.currentUser);
    await FirebaseAuth.instance.signOut();
    print("Signed user out.");
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', (route) => false);
  
  }

