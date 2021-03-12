import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';

// Checklist page, with check boxes.
class CheckListPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // FIU's navy blue color.

    // All checkbox options

    CheckBox fever =
        CheckBox(title: "Fever (temperature of 100.4°F or higher) or chills");
    CheckBox cough = CheckBox(title: "Cough");
    CheckBox breath =
        CheckBox(title: "Shortness of breath / Difficulty breathing");
    CheckBox fatigue = CheckBox(title: "Fatigue");
    CheckBox muscle = CheckBox(title: "Muscle or body aches");
    CheckBox headaches = CheckBox(title: "Headaches");
    CheckBox taste = CheckBox(title: "New loss of taste or smell");
    CheckBox throat = CheckBox(title: "Sore throat");
    CheckBox nose = CheckBox(title: "Congestion or runny nose");
    CheckBox nausea = CheckBox(title: "Nausea or vomiting");
    CheckBox diarrhea = CheckBox(title: "Diarrhea");
    CheckBox noSymp = CheckBox(title: "I am experiencing no symptoms");

    List options = [
      fever,
      cough,
      breath,
      fatigue,
      muscle,
      headaches,
      taste,
      throat,
      nose,
      nausea,
      diarrhea,
      noSymp
    ];

    return Scaffold(
        appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back,
                  color: AppTheme.Colors.blueFIU, size: 35),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: ListView(
            children: <Widget>[
              // "Safety Screening Checklist" text.
              Container(
                  // Position of text on page.
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 315,
                    child: Text('Safety Screening Checklist',
                        style: TextStyle(
                          color: AppTheme.Colors.blueFIU,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                        )),
                  )),
              Container(
                padding: EdgeInsets.only(
                    top:
                        10), // Position of both the box and the text within it on page.
                alignment: Alignment.topCenter,
                child: Container(
                  height: 120,
                  width: 400,
                  decoration: BoxDecoration(
                      // The edged box itself.
                      color: AppTheme.Colors.blueFIU,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  // To hold text within the box.
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        width: 400,
                        alignment: Alignment.center,
                        child: Text(
                          "In the past 48 hours, did have any of these following COVID-19 symptoms listed below that are new or unusual for you? Select all that apply:",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      )),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.topCenter,
                  width: 315,
                  child: Column(
                    children: <Widget>[
                      fever,
                      cough,
                      breath,
                      fatigue,
                      muscle,
                      headaches,
                      taste,
                      throat,
                      nose,
                      nausea,
                      diarrhea,
                      noSymp,
                    ],
                  ))
            ],
          ),
        ));
  }
}

// Checkbox tile stateful widget
class CheckBox extends StatefulWidget {
  final String title; // Symptom being experienced
  bool _value = false;
  bool greyOut;

  CheckBox({Key key, this.title}) : super(key: key); // Constructor

  // Return whether or not check box is checked
  bool get getValue {
    return _value;
  }

  set setValue(bool aValue) {
    _value = aValue;
  }

  set setGreyOut(bool aValue) {
    greyOut = aValue;
  }

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CheckboxListTile(
            value: widget._value,
            //contentPadding: const EdgeInsets.only(right: 10, left: 20),
            controlAffinity: ListTileControlAffinity.platform,
            title: Text(widget.title,
                style: Theme.of(context).textTheme.bodyText2),
            activeColor: Color.fromRGBO(8, 30, 63, 1.0),
            onChanged: (value) {
              setState(() {
                widget._value = value;
              });
            }));
  }
}
