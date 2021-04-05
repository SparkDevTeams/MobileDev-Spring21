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
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;

  bool _faceIdValue = false;
  final languageButtons = [
    // yes and no options for first question
    ButtonSetting(
        id: 1,
        value: true,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'English'),
    ButtonSetting(
        id: 2,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'Spanish'),
    ButtonSetting(
        id: 3,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'Creole'),
  ];

  final onOffOne = [
    ButtonSetting(
        id: 1,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'On'),
    ButtonSetting(
        id: 1,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'Off'),
  ];

  final onOffTwo = [
    ButtonSetting(
        id: 2,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'On'),
    ButtonSetting(
        id: 2,
        value: false,
        height: 50.0,
        width: 100.0,
        colorBackground: Colors.white,
        colorText: const Color.fromRGBO(8, 30, 63, 1.0),
        text: 'Off'),
  ];

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
                  borderRadius: BorderRadius.circular(25),
                  color: AppTheme.Colors.blueFIU),
              child: Text(
                "Logged in as: $firstname $lastname",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Select Language:",
                style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildLanguageButton(languageButtons[0]),
                SizedBox(width: 21),
                buildLanguageButton(languageButtons[1]),
                SizedBox(width: 21),
                buildLanguageButton(languageButtons[2]),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Notifications &\nPreferences:",
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            SizedBox(height: 10),
            /* Text(
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
              children: <Widget>[
                buildOnOffButton(onOffOne[0]),
                SizedBox(width: 40),
                buildOnOffButton(onOffOne[1])
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
                buildOnOffButton(onOffTwo[0]),
                SizedBox(width: 40),
                buildOnOffButton(onOffTwo[1])
              ],
            ),
            */

            CheckboxListTile(
              contentPadding: const EdgeInsets.only(right: 0),
              value: _value1,
              checkColor: Colors.white,
              activeColor: Color.fromRGBO(8, 30, 63, 1.0),
              onChanged: (value) {
                setState(() {
                  _value1 = value;
                });
              },
              title: Text(
                "Face ID",
                style: new TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 2),
            CheckboxListTile(
              contentPadding: const EdgeInsets.only(right: 0),
              value: _value2,
              checkColor: Colors.white,
              activeColor: Color.fromRGBO(8, 30, 63, 1.0),
              onChanged: (value) {
                setState(() {
                  _value2 = value;
                });
              },
              title: Text(
                "Get Screening Reminders",
                style: new TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 5),
            CheckboxListTile(
              contentPadding: const EdgeInsets.only(right: 0),
              value: _value3,
              checkColor: Colors.white,
              activeColor: Color.fromRGBO(8, 30, 63, 1.0),
              onChanged: (value) {
                setState(() {
                  _value3 = value;
                });
              },
              title: Text(
                "Notify Instructors",
                style: new TextStyle(
                    fontSize: 18, decoration: TextDecoration.underline),
              ),
            ),
            Container(
              width: 310,
              child: Padding(
                padding: const EdgeInsets.only(),
                child: Text(
                  "The COVID Response Team will only notify instructors if the student has recieved a RED on their safety screening. It is the student’s responsibilility to follow up with the instructor regardless of screening outcome.",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                  alignment: Alignment.topCenter,
                  child: RoundedButtons('Log out', 18.0, 50.0, 200.0,
                      Color.fromRGBO(8, 30, 63, 1.0), Colors.white, 25.0, () async {
                        print(FirebaseAuth.instance.currentUser);
                        await FirebaseAuth.instance.signOut();
                        print("Signed user out.");
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (route) => false);
                      }
                  )
              )
            ),
            SizedBox(
              height: 40,
            )
          ], crossAxisAlignment: CrossAxisAlignment.start),
        ),
      ),
    );
  }

  Widget buildOnOffButton(ButtonSetting setting) => buildToggleButton(
      // Widget for on / off buttons

      setting: setting,
      onClicked: () {
        setState(() {
          if (setting.id == 1) {
            if (setting.text == 'On') {
              setting.value = true;
              setting.colorText = Colors.white;
              setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);

              onOffOne[1].value = false;
              onOffOne[1].colorText = Color.fromRGBO(8, 30, 63, 1.0);
              onOffOne[1].colorBackground = Colors.white;
            } else {
              setting.value = true;
              setting.colorText = Colors.white;
              setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);

              onOffOne[0].value = false;
              onOffOne[0].colorText = Color.fromRGBO(8, 30, 63, 1.0);
              onOffOne[0].colorBackground = Colors.white;
            }
          } else {
            if (setting.text == 'On') {
              setting.value = true;
              setting.colorText = Colors.white;
              setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);

              onOffTwo[1].value = false;
              onOffTwo[1].colorText = Color.fromRGBO(8, 30, 63, 1.0);
              onOffTwo[1].colorBackground = Colors.white;
            } else {
              setting.value = true;
              setting.colorText = Colors.white;
              setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);

              onOffTwo[0].value = false;
              onOffTwo[0].colorText = Color.fromRGBO(8, 30, 63, 1.0);
              onOffTwo[0].colorBackground = Colors.white;
            }
          }
        });
      });

  Widget buildLanguageButton(ButtonSetting setting) => buildToggleButton(
      // Widget for language buttons

      setting: setting,
      onClicked: () {
        setState(() {
          if (setting.id == 1) {
            setting.colorText = Colors.white;
            setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);
            setting.value = true;

            languageButtons[1].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[1].colorBackground = Colors.white;
            languageButtons[1].value = false;

            languageButtons[2].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[2].colorBackground = Colors.white;
            languageButtons[2].value = false;
          } else if (setting.id == 2) {
            setting.colorText = Colors.white;
            setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);
            setting.value = true;

            languageButtons[0].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[0].colorBackground = Colors.white;
            languageButtons[0].value = false;

            languageButtons[2].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[2].colorBackground = Colors.white;
            languageButtons[2].value = false;
          } else if (setting.id == 3) {
            setting.colorText = Colors.white;
            setting.colorBackground = Color.fromRGBO(8, 30, 63, 1.0);
            setting.value = true;

            languageButtons[0].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[0].colorBackground = Colors.white;
            languageButtons[0].value = false;

            languageButtons[1].colorText = Color.fromRGBO(8, 30, 63, 1.0);
            languageButtons[1].colorBackground = Colors.white;
            languageButtons[1].value = false;
          }
        });
      });

  Widget buildToggleButton(
          {
          // The actual yes / no button widget, takes properties from ButtonSetting class

          @required
              ButtonSetting
                  setting, // object of button setting passed here, contains properties for widget

          @required
              VoidCallback
                  onClicked // here, a function is passed that decides how the state of the
          // yes / no button will be set depending on whether the button
          // being made is selected or deselected
          }) =>
      Container(
        height: setting.height,
        width: setting.width,
        child: DecoratedBox(
          // class for filling in the button when clicked with color
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              color: setting.colorBackground // set background color for button
              ),
          child: Theme(
            data: Theme.of(context).copyWith(
                buttonTheme: ButtonTheme.of(context).copyWith(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
            child: OutlineButton(
              textColor:
                  setting.colorText, // set the color of the text in the button
              highlightElevation: 0,
              child: Container(
                child: Text(
                  "${setting.text}",
                  style: new TextStyle(
                      fontSize: setting.fontSize, // set size of the text
                      fontFamily: "Be Vietnam"),
                ),
              ),
              highlightedBorderColor: setting.colorBorder,
              borderSide: BorderSide(color: setting.colorBorder, width: 2),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(
                    setting.circularRadius), // set roundness of button
              ),
              onPressed: () => onClicked(),
            ),
          ),
        ),
      );
}

class ButtonSetting {
// A class for creating a yes / no button's properties

  String text; // yes or no
  bool value; // initial value of button (set to false)
  double height; // height of button
  double width; // width of button
  Color colorBackground; // background color of button
  Color colorText; // color of text
  Color colorBorder; // color of button's border
  double circularRadius; // roundness of butoon
  double fontSize; // size of font
  int id; // id

  ButtonSetting({
    @required this.text,
    @required this.height,
    @required this.width,
    @required this.colorBackground,
    @required this.colorText,
    @required this.value,
    @required this.id,
    this.colorBorder = const Color.fromRGBO(8, 30, 63, 1.0),
    this.circularRadius = 30.0,
    this.fontSize = 17.0,
  });
}
