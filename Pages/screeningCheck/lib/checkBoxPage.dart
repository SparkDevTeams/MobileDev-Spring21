import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:url_launcher/url_launcher.dart';
import 'resultsPageAUTHORIZED.dart';
import 'resultsPageUNAUTHORIZED.dart';
import 'ButtonWidget.dart';

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
    SymptomSetting(title: 'Fever (temperature of 100.4°F or higher) or chills'),
    SymptomSetting(title: 'Cough'),
    SymptomSetting(title: 'Shortness of breath / Difficulty breathing'),
    SymptomSetting(title: 'Fatigue'),
    SymptomSetting(title: 'Muscle or body aches'),
    SymptomSetting(title: 'Headaches'),
    SymptomSetting(title: 'New loss of taste or smell'),
    SymptomSetting(title: 'Sore throat'),
    SymptomSetting(title: 'Congestion or runny nose'),
    SymptomSetting(title: 'Nausea or vomiting'),
    SymptomSetting(title: 'Diarrhea')
  ];
  
  int counter = 0;    // holds the value of how many of the symptoms checkboxes are checked
  
  Widget build(BuildContext context) {
  // The main screening checklist page widget, with all the important
  // texts and shapes
  
    const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.

    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: FIUNavyBlue, size: 35),
            onPressed: () {  },     // TODO: Go back to homepage functionality
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
                    ...symptoms.map(buildSympCheckBox).toList(),    // create the checkbox widgets
                    buildNoSympCheckBox(noSymptoms)                 // no symptoms checkbox
                  ],
                )
              ),
              Container(
                padding: EdgeInsets.only(bottom: 53, top: 30),
                alignment: Alignment.topCenter,
                child: RoundedButtons
                ('Continue', 
                18.0, 50.0, 200.0, 
                FIUNavyBlue,
                Colors.white, 
                25.0, 
                () {
                  if (noSymptoms.value == false && counter == 0)    // if the user doesn't select any checkbox
                  {
                    Widget cancelButton = FlatButton(   // button to exit alert dialog
                      child: Text("OK"),
                      onPressed:  () {
                        Navigator.of(context).pop();
                      },
                    );

                    AlertDialog alert = AlertDialog(    // alert dialog for the user
                      title: Text("No option selected"),
                      content: Text("You have not selected any of the checkboxes. Please select at least one to continue."),
                      actions: [
                        cancelButton
                      ],
                    );

                    // show the dialog
                    showDialog(                         // show the alert dialog to user
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }
                  
                  else
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckListPageTwo(counter: counter)),
                    );
                  }
                }
              ),
            )],
          ),
        ));
  }

  Widget buildNoSympCheckBox(SymptomSetting setting) => buildCheckBox(
  // Widget made specifically for the no symptoms checkbox, uses the
  // buildCheckBox widget, passing to it a SymptomSetting object and the
  // onClicked function, which holds the state of the checkbox.

    setting: setting,                        // object of SymptomSetting is passed here
    onClicked: () {                          // onClicked function, decides the state of the checkbox
      final newValue = !setting.value;   

      // Sets the state of the checkboxes, changes them based on what is done
      // to the no symptoms checkbox.
      setState(() {
        if(setting.value = true)             // if the no symptoms checkbox is currently checked...
        {
          symptoms.forEach((symptom) {
            symptom.value = !setting.value;  // then uncheck every other checkbox
            counter = 0;
            print(counter.toString());    
          });
        } 

        setting.value = newValue;
      });
    });

  Widget buildSympCheckBox(SymptomSetting setting) => buildCheckBox(
  // Widget for all the symptoms checkboxes, except the no symptoms checkbox.
  // This widget also uses the buildCheckBox widget, passing to it a SymptomSetting
  // object and the onClicked function, which holds the state of the checkbox.

    setting: setting,     // object of SymptomSetting is passed here
    onClicked: () {       // onClicked function, decides the state of the checkbox

      // Sets the state of the checkboxes, changes them based on what is done
      // to the any checkbox associated with a symptom.
      setState(() {
        final newValue = !setting.value;
        setting.value = newValue;           // either checks or unchecks the checkbox

        if (!newValue) {                    // unchecks the no symptoms checkbox when a symptom checkbox is checked
          counter--;
          print(counter.toString());                
          noSymptoms.value = false;         
        } 

        // otherwise, make sure no symptoms checkbox is unchecked when a symptom checkbox is checked
        else {
          counter++;  
          print(counter.toString());    
          final allow = symptoms.every((setting) => setting.value);
          noSymptoms.value = allow;
        }
      });
    },
  );

  Widget buildCheckBox({
  // Widget for creating a basic checkbox list tile, takes in two parameters:

    @required SymptomSetting setting,   // object of SymptomSetting is passed here (includes title of symptom
                                        // and value of false for the checkbox)

    @required VoidCallback onClicked,   // here, a function is passed that decides how the state of the
                                        // checkbox list tile will be set depending on whether the checkbox
                                        // being made is for a symptom or for the no symptoms checkbox
  }) =>
      CheckboxListTile(
        value: setting.value,   // value of whether or not the checkbox is checked (true for checked, false for unchecked)
        contentPadding: const EdgeInsets.only(right: 10, left: 20),
        controlAffinity: ListTileControlAffinity.platform,
        title: Text(
          setting.title,
          style: TextStyle(
            fontFamily: "Be Vietnam",
            fontSize: 15.0,
            fontWeight: FontWeight.normal,
          )
        ),
        activeColor: Color.fromRGBO(8, 30, 63, 1.0),
        onChanged: (value) => (onClicked())   // change state
      );
}

class SymptomSetting {
// A class for creating a symptom that takes in
// a title of a symptom and also sets the initial
// value of its checkbox to unchecked (false)

  String title;   // name of the symptom
  bool value;     // initial value of checkbox of symptom (set to false)

  SymptomSetting({
    @required this.title, // get name of symptom
    this.value = false,   // set checkbox to unchecked (false)
  });
}

// FIRST SCREENING CHECKLIST PAGE ENDS HERE

class CheckListPageTwo extends StatefulWidget {
  @override
  _CheckListPageTwoState createState() => _CheckListPageTwoState();

  final int counter;  // Counter for the screening checklist score from the first page

  const CheckListPageTwo({ Key key, this.counter }) : super(key: key);
}

class _CheckListPageTwoState extends State<CheckListPageTwo> {
// The second screening checklist page of the FIU P3 App.

final FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.
final FIUMagenta = const Color.fromRGBO(204, 0, 102, 1.0);  // FIU's magenta color.
int counterTwo = 0;                                         // counts score from this page

final options1 = [                                          // yes and no options for first question
  ButtonSetting(
    height: 50.0, 
    width: 135, 
    colorBackground: Colors.white, 
    id: 1, 
    colorText: const Color.fromRGBO(8, 30, 63, 1.0), 
    text: 'Yes'
  ),
  ButtonSetting(
    height: 50.0, 
    width: 135, 
    colorBackground: Colors.white, 
    id: 1, 
    colorText: const Color.fromRGBO(8, 30, 63, 1.0), 
    text: 'No'
  ),
];

final options2 = [                                          // yes and no options for second question
  ButtonSetting(
    height: 50.0, 
    width: 135, 
    colorBackground: Colors.white, 
    id: 2, 
    colorText: const Color.fromRGBO(8, 30, 63, 1.0), 
    text: 'Yes'
  ),
  ButtonSetting(
    height: 50.0, 
    width: 135, 
    colorBackground: Colors.white, 
    id: 2, 
    colorText: const Color.fromRGBO(8, 30, 63, 1.0), 
    text: 'No'
  ),
];

AgreeSetting agreeButton = new AgreeSetting();

  @override
   Widget build(BuildContext context) {
  // The main screening checklist second page widget, with all the important
  // texts and shapes

  const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.

    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: FIUNavyBlue, size: 35),
            onPressed: () {
              Navigator.pop(context);
             },     
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
                  // First question textbox
                  Container(
                    padding: EdgeInsets.only(top: 30),    // Position of both the first question box and the text within it on page.
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 130.0,
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
                        child: Text(
                          'Have you been in contact with anyone diagnosed with, or displaying symptoms of, COVID-19 within the last 14 days?',
                            style: TextStyle(
                              fontFamily: "Be Vietnam",
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.white
                            )
                          )
                        ),
                    ),
                  ),
              ),
              // Yes and no buttons for first question
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 25, right: 20, left: 20),
                width: 315,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 42),
                      child: buildYesButton(options1[0])
                    ),
                    Container(
                      child: buildNoButton(options1[1])
                    ),
                  ],
                )
              ),
              // Second question textbox
              Container(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 91.0,
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
                        child: Text(
                          'Within the last 14 days, have you tested positive for COVID-19?',
                          style: TextStyle(
                            fontFamily: "Be Vietnam",
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                          )
                        )
                      ),
                    ),
                  ),
              ),
              // Yes and no buttons for second question
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: 25, right: 20, left: 20),
                width: 315,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 42),
                      child: buildYesButton(options2[0])
                    ),
                    Container(
                      child: buildNoButton(options2[1])
                    ),
                  ],
                )
              ),
              // Pink dotted border with text, includes an agreement statement for user
              Container(                            
                alignment: Alignment.topCenter,
                child: Container(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(25.0),
                    color: FIUMagenta,
                    strokeWidth: 3,
                    dashPattern: [5,5],
                    child: Container(
                      height: 206.0,
                      width: 315.0,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "By submitting this screening, I affirm and attest that all the information and answers to screening questions herein are complete, true and correct to the best of my knowledge.",
                              style: TextStyle(
                                fontFamily: "Be Vietnam",
                                fontSize: 14.0, 
                                color: FIUNavyBlue
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Container(
                                  padding: const EdgeInsets.only(left: 46),
                                  child: Row(
                                    children: [
                                      buildAgreeButton(setting: agreeButton),
                                      Container(
                                        padding: const EdgeInsets.only(bottom: 10.0),
                                        child: Text(
                                          "I Agree",
                                          style: TextStyle(
                                            fontFamily: "Be Vietnam",
                                            fontSize: 18.0, 
                                            color: FIUNavyBlue
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Text at the bottom of pink dotted border for more information
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  width: 315,
                  child: Text(
                    '*Questions and symptoms are based on the latest guidelines from the CDC and clinicians at Florida International University.',
                    style: TextStyle(
                      fontFamily: "Be Vietnam",
                      fontSize: 14.0, 
                      color: FIUNavyBlue
                    )
                  ),
                )
              ),
              Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  width: 315,
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Centers for Disease Control and Prevention  ",
                            style: TextStyle(
                              fontFamily: "Be Vietnam",
                              fontSize: 14.0, 
                              color: FIUNavyBlue,
                              decoration: TextDecoration.underline,
                            )
                          ),
                          WidgetSpan(
                            child: Icon(Icons.open_in_new, 
                            size: 11,
                            color: FIUNavyBlue
                          ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () => launch('https://www.cdc.gov/'),
                  )
                )
              ),
              Container(
                padding: EdgeInsets.only(bottom: 53, top: 30),
                alignment: Alignment.topCenter,
                child: RoundedButtons
                ('Submit', 
                18.0, 50.0, 200.0, 
                FIUNavyBlue,
                Colors.white, 
                25.0, 
                () {
                  // if statement checks if user either answers none or only one of the questions or if they did not agree
                  // to the statement in the pink dotted border
                  
                  if (((options1[0].value == false && options1[1].value == false) ||
                       (options2[0].value == false && options2[1].value == false)) ||
                      agreeButton.value == false)                           
                  {
                    Widget cancelButton = FlatButton(           // button to exit alert dialog
                      child: Text("OK"),
                      onPressed:  () {
                        Navigator.of(context).pop();
                      },
                    );

                    AlertDialog alert = AlertDialog(            // alert dialog for the user
                      title: Text("You're missing something"),
                      content: Text("You either have not answered any or only one of the questions above or you did not agree to the statement above. Answer both questions and agree to the statement above to submit your screening."),
                      actions: [
                        cancelButton
                      ],
                    );

                    // show the dialog
                    showDialog(                                 // show the alert dialog to user
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                  }

                  else
                  {
                    if (widget.counter + counterTwo > 0)    // if the user had a score of more than zero, not authorized
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultsUNAUTHORIZED()),
                      );
                    }

                    else                                    // otherwise, authorized
                    {
                      counterTwo = 0;    
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResultsAUTHORIZED()),
                      );
                    }
                  }
                }
              ),
            )
            ],
          )
        )
    );
  }

  Widget buildNoButton(ButtonSetting setting) => buildToggleButton(
  // Widget for 'no' buttons

    setting: setting, 
    onClicked: () {
      setState(() {
        // If branch for the first question
        if (setting.id == 1)
        {
          setting.colorText = Colors.white;
          setting.colorBackground = FIUNavyBlue;
          setting.value = true;
          if (counterTwo - 1 >= 0){    // if else statements to prevent counterTwo value of less than 0
            if (setting.clickCounter == 0)
            {
              counterTwo--;
            }
            setting.clickCounter++;
            options1[0].clickCounter = 0;
          }
          else {
            counterTwo = 0;
          }

          options1[0].value = false;
          options1[0].colorText = FIUNavyBlue;
          options1[0].colorBackground = Colors.white;
        }
        
        // Else branch for the second question
        else
        {
          setting.colorText = Colors.white;
          setting.colorBackground = FIUNavyBlue;
          setting.value = true;
          if (counterTwo - 1 >= 0){    // if else statements to prevent counterTwo value of less than 0
            if (setting.clickCounter == 0)
            {
              counterTwo--;
            }
            setting.clickCounter++;
            options2[0].clickCounter = 0;
          }
          else {
            counterTwo = 0;
          }

          options2[0].value = false;
          options2[0].colorText = FIUNavyBlue;
          options2[0].colorBackground = Colors.white;
        }
      });
    }
  );

  Widget buildYesButton(ButtonSetting setting) => buildToggleButton(
  // Widget for 'yes' buttons

    setting: setting, 
    onClicked: () {
      setState(() {
        // If branch for the first question
        if (setting.id == 1)
        {
          setting.colorText = Colors.white;
          setting.colorBackground = FIUNavyBlue;
          setting.value = true;
          if (counterTwo + 1 <= 2){    // if else statements to prevent counterTwo value of more than 2
            if (setting.clickCounter == 0)
            {
              counterTwo++;
            }
            setting.clickCounter++;
            options1[1].clickCounter = 0;
          }
          else {
            counterTwo = 2;
          }

          options1[1].value = false;
          options1[1].colorText = FIUNavyBlue;
          options1[1].colorBackground = Colors.white;
        }
        
        // Else branch for the second question
        else
        {
          setting.colorText = Colors.white;
          setting.colorBackground = FIUNavyBlue;
          setting.value = true;
          if (counterTwo + 1 <= 2){    // if else statements to prevent counterTwo value of more than 2
            if (setting.clickCounter == 0)
            {
              counterTwo++;
            }
            setting.clickCounter++;
            options2[1].clickCounter = 0;
          }
          else {
            counterTwo = 2;
          }

          options2[1].value = false;
          options2[1].colorText = FIUNavyBlue;
          options2[1].colorBackground = Colors.white;
        }
      });
    }
  );
  
  Widget buildToggleButton({
  // The actual yes / no button widget, takes properties from ButtonSetting class

    @required ButtonSetting setting,    // object of button setting passed here, contains properties for widget

    @required VoidCallback onClicked    // here, a function is passed that decides how the state of the
                                        // yes / no button will be set depending on whether the button
                                        // being made is selected or deselected
  }) => 
    Container(
      height: setting.height,
      width: setting.width,
      child: DecoratedBox(                                           // class for filling in the button when clicked with color
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25.0),), 
          color: setting.colorBackground                             // set background color for button
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonTheme.of(context).copyWith(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
          child: OutlineButton(
            textColor: setting.colorText,                           // set the color of the text in the button
            highlightElevation: 0,
            child: Container(
              alignment: Alignment(0.0, -0.2),
              child: Text(
                "${setting.text}",
                style: new TextStyle(fontSize: setting.fontSize,    // set size of the text
                fontFamily: "Be Vietnam"),
              ),
            ),
            highlightedBorderColor: setting.colorBorder,
            borderSide: BorderSide(color: setting.colorBorder, width: 2),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(setting.circularRadius),    // set roundness of button
            ),
            onPressed: () => onClicked(),
          ),
        ),
      ),
    );

  Widget buildAgreeButton({
  // The actual agree button widget, takes properties from AgreeSetting class

    @required AgreeSetting setting,    // object of AgreeSetting passed here, contains properties for widget

  }) => Container(
      child: DecoratedBox(
        decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: setting.colorBackground
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonTheme.of(context).copyWith(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)),
          child: OutlineButton(
            shape: CircleBorder(),
            borderSide: BorderSide(color: Color.fromRGBO(8, 30, 63, 1.0), width: 2),
            child: Text(''),
            onPressed: () => {
              setState(() {
                final newValue = !setting.value;
                setting.value = newValue;           // either colors or uncolors 'I Agree' button

                if (setting.value == true)
                {
                  setting.colorBackground = FIUNavyBlue;
                }

                else
                {
                  setting.colorBackground = Colors.white;
                }
              })
            },
          )
        ),
      )
    );
}

class ButtonSetting {
// A class for creating a yes / no button's properties

  String text;              // yes or no
  bool value;               // initial value of button (set to false)
  double height;            // height of button
  double width;             // width of button
  Color colorBackground;    // background color of button
  Color colorText;          // color of text
  Color colorBorder;        // color of button's border
  double circularRadius;    // roundness of butoon
  double fontSize;          // size of font
  int id;                   // ID of button, determines whether its for first or second question
  int clickCounter;         // amount of times a button is clicked after it is selected

  ButtonSetting({
    @required this.id,
    @required this.text,   
    @required this.height,
    @required this.width,
    @required this.colorBackground,
    @required this.colorText,
    this.colorBorder = const Color.fromRGBO(8, 30, 63, 1.0),
    this.circularRadius = 25.0,
    this.fontSize = 18.0,
    this.value = false,     
    this.clickCounter = 0
  });
}

class AgreeSetting {
// Class to set properties for the 'I Agree' button

  bool value;               // Whether button is colored in or not
  Color colorBackground;    // background color of button

  AgreeSetting({
    this.colorBackground = Colors.white,
    this.value = false
  });
}