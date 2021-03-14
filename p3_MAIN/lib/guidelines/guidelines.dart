import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';

class Guidelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: Column(children: <Widget>[
              Text(
                "On Campus Guidelines",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Text(
                "Please follow these guidelines while on campus to ensure the safety of everyone",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(padding: const EdgeInsets.only(top: 15, bottom: 15)),
              Container(
                child: RoundedBox(
                    '1. Wear a face covering at all times on campus.',
                    Colors.white,
                    14.0,
                    10.0,
                    AppTheme.Colors.blueFIU,
                    90.0,
                    400.0,
                    Alignment.center),
              ),
              Container(
                child: RoundedBox(
                    '2. Maintain social distancing of 6 feet when around others.',
                    AppTheme.Colors.blueFIU,
                    14.0,
                    10.0,
                    Colors.grey[300],
                    90.0,
                    400.0,
                    Alignment.center),
              ),
              Container(
                child: RoundedBox(
                    '3. Upon arriving on campus, please sanitize your hands by either washing them with soap and water; and using hand sanitizer.',
                    Colors.white,
                    14.0,
                    10.0,
                    AppTheme.Colors.blueFIU,
                    90.0,
                    400.0,
                    Alignment.center),
              ),
              Container(
                child: RoundedBox(
                    '4. Frequently wash your hands whenever making contact with a surface in a public place. This includes items like door handles, tables, chairs, etc.',
                    AppTheme.Colors.blueFIU,
                    14.0,
                    10.0,
                    Colors.grey[300],
                    90.0,
                    400.0,
                    Alignment.center),
              ),
              Container(
                child: RoundedBox(
                    '5. Avoid gathering in break rooms or other areas where there are additional people.',
                    Colors.white,
                    14.0,
                    10.0,
                    AppTheme.Colors.blueFIU,
                    80.0,
                    400.0,
                    Alignment.center),
              ),
              Container(padding: const EdgeInsets.only(top: 25, bottom: 25)),
              Container(
                alignment: Alignment.center,
                child: Container(
                  height: 50.0,
                  width: 200.0,
                  child: RaisedButton(
                    //color: Colors.white,
                    textColor: AppTheme.Colors.blueFIU,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }
}
