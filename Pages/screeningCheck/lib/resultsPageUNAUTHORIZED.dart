import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ButtonWidget.dart';

// Results page for users unauthorized to go on campus.
class ResultsUNAUTHORIZED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);   // FIU's navy blue color.
    const FIUMagenta = const Color.fromRGBO(204, 0, 102, 1.0);  // FIU's magenta color.
    return Scaffold(
      // Empty navigation bar, not necessary for this page.
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // "Safety Screening Checklist" text.
              Container(
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
              // Edged box in the center of the screen, contains AUTHORIZED / UNAUTHORIZED text.
              Container(
                padding: EdgeInsets.only(top: 70),    // Position of both the box and the text within it on page.
                alignment: Alignment.topCenter,
                child: Container(
                  height: 140.0,
                  width: 315.0,
                  decoration: BoxDecoration(    // The edged box itself.
                      color: FIUMagenta,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  // To hold text within the box.
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "You are NOT AUTHORIZED to go on campus. Please stay home.",
                        style: TextStyle(
                            fontFamily: "Be Vietnam",
                            fontSize: 17.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              // Contains the text the belong under the box, both bold and light font weight text.
              Container(
                  padding: EdgeInsets.only(top: 20),
                  width: 315,
                  alignment: Alignment.topCenter,
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(
                        fontFamily: "Be Vietnam",
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            'Do NOT visit campus at all.\n',
                      ),
                      TextSpan(
                          text:
                              'Please quarantine for at least 14 days prior to returning on campus. If you need resources to help you take the next step, please go to the home page and click on "COVID-19 Resources."',
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ],
                  ))),
              // Home button.
              Expanded(                                                                 // Added Expanded and Align widgets to fix home button
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(bottom: 33),
                    child: RoundedButtons('Home', 18.0, 50.0, 200.0, FIUNavyBlue,
                        Colors.white, 25.0, () {}                                       // TODO: home button goes to homepage
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
