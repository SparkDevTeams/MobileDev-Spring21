import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'ButtonWidget.dart';

class ResultsAUTHORIZED extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const FIUNavyBlue = const Color.fromRGBO(8, 30, 63, 1.0);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: 315,
                    child: Text('Safety Screening Checklist',
                        style: TextStyle(
                          color: FIUNavyBlue,
                          fontFamily: "Be Vietnam",
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                        )),
                  )),
              Container(
                padding: EdgeInsets.only(top: 90),
                alignment: Alignment.topCenter,
                child: Container(
                  height: 140.0,
                  width: 315.0,
                  decoration: BoxDecoration(
                      color: FIUNavyBlue,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "You are AUTHORIZED to go on campus, be safe!",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  width: 315,
                  alignment: Alignment.topCenter,
                  child: RichText(
                      text: TextSpan(
                    style: TextStyle(
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
                              fontSize: 15.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal))
                    ],
                  ))),
              Container(
                padding: EdgeInsets.only(top: 100),
                alignment: Alignment.topCenter,
                child: RoundedButtons('Home', 18.0, 50.0, 200.0, FIUNavyBlue,
                    Colors.white, 25.0, () {}),
              )
            ],
          ),
        ));
  }
}
