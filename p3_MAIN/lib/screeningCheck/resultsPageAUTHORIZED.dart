import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';

// Results page for users authorized to go on campus.
class ResultsAUTHORIZED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const FIUNavyBlue =
        const Color.fromRGBO(8, 30, 63, 1.0); // FIU's navy blue color.
    return Scaffold(
        // Empty navigation bar, not necessary for this page.
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            color: AppTheme.Colors.blueFIU,
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // "Safety Screening Checklist" text.
              Container(
                  child: SizedBox(
                width: 315,
                child: Text('Safety Screening Checklist',
                    style: Theme.of(context).textTheme.headline1),
              )),
              SizedBox(
                height: 100,
              ),
              // Edged box in the center of the screen, contains AUTHORIZED / UNAUTHORIZED text.
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 140.0,
                          width: 315.0,
                          decoration: BoxDecoration(
                              // The edged box itself.
                              color: FIUNavyBlue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          // To hold text within the box.
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "You are AUTHORIZED to go on campus, be safe!",
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
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          width: 400,
                          alignment: Alignment.topCenter,
                          child: Center(
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
                                      'Remember these guidelines when you visit campus:\n',
                                ),
                                TextSpan(
                                    text:
                                        '1. Wear a face mask at ALL TIMES.\n2. Stay 6 ft. apart from others.\n3. Wash your hands and use hand sanitizer.\n4. Clean surfaces and equipment before use.',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal))
                              ],
                            )),
                          ))
                    ],
                  ),
                ),
              ),
              // Contains the text the belong under the box, both bold and light font weight text.

              // Home button.
            ],
          ),
        ));
  }
}
