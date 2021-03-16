import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';

// Checklist page, with check boxes.
class CheckListPageOne extends StatefulWidget {
  @override
  _CheckListPageOneState createState() => _CheckListPageOneState();
}

class _CheckListPageOneState extends State<CheckListPageOne> {
// The first screening checklist page of the FIU P3 App.

  // no symptoms SymptomSetting object for no symptoms checkbox

  final noSymptoms = SymptomSetting(title: 'I am experiencing no symptoms');

  // All symptom options as SymptomSetting objects to initialize checkboxes

  final symptoms = [
    SymptomSetting(
        title: 'Fever (temperature of 100.4°F or higher) or chills.'),
    SymptomSetting(title: 'Cough'),
    SymptomSetting(title: 'Shortness of breath / Difficulty breathing.'),
    SymptomSetting(title: 'Fatigue'),
    SymptomSetting(title: 'Muscle or body aches'),
    SymptomSetting(title: 'Headaches'),
    SymptomSetting(title: 'New loss of taste or smell'),
    SymptomSetting(title: 'Sore throat'),
    SymptomSetting(title: 'Congestion or runny nose'),
    SymptomSetting(title: 'Nausea or vomiting'),
    SymptomSetting(title: 'Diarrhea')
  ];

  int counter =
      0; // holds the value of how many of the symptoms checkboxes are checked

  Widget build(BuildContext context) {
    // The main screening checklist page widget, with all the important
    // texts and shapes
    // FIU's navy blue color.

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
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ListView(
            children: <Widget>[
              // "Safety Screening Checklist" text.
              Container(
                  padding:
                      EdgeInsets.only(top: 20), // Position of text on page.
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 315,
                    child: Text('Safety Screening Checklist',
                        style: TextStyle(
                          color: AppTheme.Colors.blueFIU,
                          fontSize: 39,
                          fontWeight: FontWeight.w800,
                        )),
                  )),
              Container(
                padding: EdgeInsets.only(
                    top:
                        30), // Position of both the box and the text within it on page.
                alignment: Alignment.topCenter,
                child: Container(
                  height: 152.0,
                  width: 315.0,
                  decoration: BoxDecoration(
                      // The edged box itself.
                      color: AppTheme.Colors.blueFIU,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  // To hold text within the box.
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                        width: 315,
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  'Do you currently have or did you have in the past 48 hours any of the following COVID-19 symptoms listed below ',
                            ),
                            TextSpan(
                                text: 'that are new or unusual for you?',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            TextSpan(
                              text: ' Select all that apply:',
                            )
                          ],
                        ))),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  width: 315,
                  child: Column(
                    children: <Widget>[
                      ...symptoms
                          .map(buildSympCheckBox)
                          .toList(), // create the checkbox widgets
                      buildNoSympCheckBox(noSymptoms) // no symptoms checkbox
                    ],
                  )),
              Container(
                padding: EdgeInsets.only(bottom: 53, top: 30),
                alignment: Alignment.topCenter,
                child: RoundedButtons('Continue', 18.0, 50.0, 200.0,
                    AppTheme.Colors.blueFIU, Colors.white, 25.0, () {
                  if (noSymptoms.value == false &&
                      counter == 0) // if the user doesn't select any checkbox
                  {
                    Widget cancelButton = FlatButton(
                      // button to exit alert dialog
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    );

                    AlertDialog alert = AlertDialog(
                      // alert dialog for the user
                      title: Text(
                        "No option selected",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      content: Text(
                        "You have not selected any of the checkboxes. Please select at least one to continue.",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      actions: [cancelButton],
                    );

                    // show the dialog
                    showDialog(
                      // show the alert dialog to user
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                }),
              )
            ],
          ),
        ));
  }

  Widget buildNoSympCheckBox(SymptomSetting setting) => buildCheckBox(
      // Widget made specifically for the no symptoms checkbox, uses the
      // buildCheckBox widget, passing to it a SymptomSetting object and the
      // onClicked function, which holds the state of the checkbox.

      setting: setting, // object of SymptomSetting is passed here
      onClicked: () {
        // onClicked function, decides the state of the checkbox
        final newValue = !setting.value;

        // Sets the state of the checkboxes, changes them based on what is done
        // to the no symptoms checkbox.
        setState(() {
          if (setting.value =
              true) // if the no symptoms checkbox is currently checked...
          {
            symptoms.forEach((symptom) {
              symptom.value =
                  !setting.value; // then uncheck every other checkbox
              counter = 0;
            });
          }

          setting.value = newValue;
        });
      });

  Widget buildSympCheckBox(SymptomSetting setting) => buildCheckBox(
        // Widget for all the symptoms checkboxes, except the no symptoms checkbox.
        // This widget also uses the buildCheckBox widget, passing to it a SymptomSetting
        // object and the onClicked function, which holds the state of the checkbox.

        setting: setting, // object of SymptomSetting is passed here
        onClicked: () {
          // onClicked function, decides the state of the checkbox

          // Sets the state of the checkboxes, changes them based on what is done
          // to the any checkbox associated with a symptom.
          setState(() {
            final newValue = !setting.value;
            setting.value = newValue; // either checks or unchecks the checkbox

            if (!newValue) {
              // unchecks the no symptoms checkbox when a symptom checkbox is checked
              counter--;
              noSymptoms.value = false;
            }

            // otherwise, make sure no symptoms checkbox is unchecked when a symptom checkbox is checked
            else {
              counter++;
              final allow = symptoms.every((setting) => setting.value);
              noSymptoms.value = allow;
            }
          });
        },
      );

  Widget buildCheckBox({
    // Widget for creating a basic checkbox list tile, takes in two parameters:

    @required
        SymptomSetting
            setting, // object of SymptomSetting is passed here (includes title of symptom
    // and value of false for the checkbox)

    @required
        VoidCallback
            onClicked, // here, a function is passed that decides how the state of the
    // checkbox list tile will be set depending on whether the checkbox
    // being made is for a symptom or for the no symptoms checkbox
  }) =>
      CheckboxListTile(
          value: setting.value,
          // value of whether or not the checkbox is checked (true for checked, false for unchecked)
          contentPadding: const EdgeInsets.only(right: 10, left: 20),
          controlAffinity: ListTileControlAffinity.platform,
          title: Text(setting.title,
              style: TextStyle(
                fontFamily: "Be Vietnam",
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
              )),
          activeColor: Color.fromRGBO(8, 30, 63, 1.0),
          onChanged: (value) => (onClicked()) // change state
          );
}

class SymptomSetting {
// A class for creating a symptom that takes in
// a title of a symptom and also sets the initial
// value of its checkbox to unchecked (false)

  String title; // name of the symptom
  bool value; // initial value of checkbox of symptom (set to false)
  int count; // whether checkbox is checked or unchecked in integer form (1 or 0)

  SymptomSetting({
    @required this.title, // get name of symptom
    this.value = false, // set checkbox to unchecked (false)
  });
}
