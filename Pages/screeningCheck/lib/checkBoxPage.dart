import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ButtonWidget.dart';

// Checklist page, with check boxes.
class CheckListPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.

    // All checkbox options

    CheckBox fever = CheckBox(title: "Fever (temperature of 100.4°F or higher) or chills");
    CheckBox cough = CheckBox(title: "Cough");
    CheckBox breath = CheckBox(title: "Shortness of breath / Difficulty breathing");
    CheckBox fatigue = CheckBox(title: "Fatigue");
    CheckBox muscle = CheckBox(title: "Muscle or body aches");
    CheckBox headaches = CheckBox(title: "Headaches");
    CheckBox taste = CheckBox(title: "New loss of taste or smell");
    CheckBox throat = CheckBox(title: "Sore throat");
    CheckBox nose = CheckBox(title: "Congestion or runny nose");
    CheckBox nausea = CheckBox(title: "Nausea or vomiting");
    CheckBox diarrhea = CheckBox(title: "Diarrhea");
    CheckBox noSymp = CheckBox(title: "I am experiencing no symptoms");

    List options = [fever, cough, breath, fatigue, muscle, headaches, taste, throat, nose, nausea, diarrhea, noSymp];

    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: FIUNavyBlue, size: 35),
            onPressed: () {  },
          )
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: ListView(
            children: <Widget>[
              // "Safety Screening Checklist" text.
              Container(
                  padding: EdgeInsets.only(top: 20),    // Position of text on page.
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 315,
                    child: Text('Safety Screening Checklist',
                        style: TextStyle(
                          color: FIUNavyBlue,
                          fontFamily: "Be Vietnam",
                          fontSize: 39,
                          fontWeight: FontWeight.w800,
                        )),
                  )),
              Container(
                padding: EdgeInsets.only(top: 30),    // Position of both the box and the text within it on page.
                alignment: Alignment.topCenter,
                child: Container(
                  height: 152.0,
                  width: 315.0,
                  decoration: BoxDecoration(    // The edged box itself.
                      color: FIUNavyBlue,
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
                            fontFamily: "Be Vietnam",
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'Do you currently have or did you have in the past 48 hours any of the following COVID-19 symptoms listed below ',
                          ),
                          TextSpan(
                              text:
                                  'that are new or unusual for you?',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text:
                                  ' Select all that apply:',
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
                )
              )
            ],
          ),
        ));
  }
}

// Checkbox tile stateful widget
class CheckBox extends StatefulWidget { 
  final String title;   // Symptom being experienced
  bool _value = false;
  bool greyOut;

  CheckBox({Key key, this.title}) : super(key: key);  // Constructor

  // Return whether or not check box is checked
  bool get getValue{
    return _value;
  }

  set setValue(bool aValue){
    _value = aValue;
  }

  set setGreyOut(bool aValue){
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
        contentPadding: const EdgeInsets.only(right: 10, left: 20),
        controlAffinity: ListTileControlAffinity.platform,
        title: Text(
          widget.title,
          style: TextStyle(
            fontFamily: "Be Vietnam",
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          )
        ),
        activeColor: Color.fromRGBO(8, 30, 63, 1.0),
        onChanged: (value) {
          setState(() {
            widget._value = value;
          });
        }
      )
    );
  }
}

