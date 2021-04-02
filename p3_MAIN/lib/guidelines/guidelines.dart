import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'package:url_launcher/url_launcher.dart';

class Guidelines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double padding = 10;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppTheme.Colors.blueFIU, size: 35),
          onPressed: () {
            Navigator.pop(context);
          }, // TODO: Go back to homepage functionality
        ),
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
              Text(
                "Please follow these guidelines while on campus to ensure your safety and everyone else's safety.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                padding: EdgeInsets.only(top: padding),
                child: RoundedBox(
                    '1. Wear a face covering at all times on campus.',
                    Colors.white,
                    14.0,
                    15.0,
                    AppTheme.Colors.blueFIU,
                    70.0,
                    400.0,
                    Alignment.centerLeft),
              ),
              Container(
                padding: EdgeInsets.only(top: padding),
                child: RoundedBox(
                    '2. Maintain social distancing of 6 feet when around others.',
                    AppTheme.Colors.blueFIU,
                    14.0,
                    15.0,
                    Colors.grey[300],
                    70.0,
                    400.0,
                    Alignment.centerLeft),
              ),
              Container(
                padding: EdgeInsets.only(top: padding),
                child: RoundedBox(
                    '3. Upon arriving on campus, please sanitize your hands by either washing them with soap and water; and using hand sanitizer.',
                    Colors.white,
                    14.0,
                    15.0,
                    AppTheme.Colors.blueFIU,
                    70.0,
                    400.0,
                    Alignment.centerLeft),
              ),
              Container(
                padding: EdgeInsets.only(top: padding),
                child: RoundedBox(
                    '4. Frequently wash your hands whenever making contact with a surface in a public place. This includes items like door handles, tables, chairs, etc.',
                    AppTheme.Colors.blueFIU,
                    14.0,
                    15.0,
                    Colors.grey[300],
                    70.0,
                    400.0,
                    Alignment.centerLeft),
              ),
              Container(
                padding: EdgeInsets.only(top: padding),
                child: RoundedBox(
                    '5. Avoid gathering in break rooms or other areas where there are additional people.',
                    Colors.white,
                    14.0,
                    15.0,
                    AppTheme.Colors.blueFIU,
                    70.0,
                    400.0,
                    Alignment.centerLeft),
              ),
              Container(padding: const EdgeInsets.only(top: 25, bottom: 25)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }
}

class RoundedBox extends StatelessWidget {
  final text,
      textColor,
      fontsize,
      borderRadius,
      color,
      height,
      width,
      alignment;

  RoundedBox(this.text, this.textColor, this.fontsize, this.borderRadius,
      this.color, this.height, this.width, this.alignment);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "$text",
          style: TextStyle(fontSize: fontsize, color: textColor),
        ),
      ),
    );
  }
}
