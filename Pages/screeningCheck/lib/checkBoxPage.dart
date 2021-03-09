import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ButtonWidget.dart';

// Checklist page, with check boxes.
class CheckListPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.
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
          child: Column(
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
            ],
          ),
        ));
  }
}
