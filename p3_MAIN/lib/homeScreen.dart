import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import './UIWidgets/ButtonWidgets.dart';
//import 'package:p3_MAIN/theme/themeData.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              // TODO: Make into non-pressable button. Make color 'cyanFIU' when bluetooth is activated, greyed out when bluetooth isnt activated.
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  icon: Icon(Icons.bluetooth),
                  splashRadius: 25,
                  color: AppTheme.Colors.blueFIU,
                  onPressed: () {}),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.settings),
                splashRadius: 25,
                color: AppTheme.Colors.blueFIU,
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ),
          ],
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Welcome to FIU!",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Welcome to campus! please be considerate of your safety as well as others!",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        "Screening Checklist",
                        "Please fill this out before coming on campus!",
                        null,
                        150.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        "Exposure Notifications",
                        "Tap to view your history of exposures of COVID-19 or submit a positive test alert.",
                        null,
                        120.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        "COVID-19 Resources",
                        "Need resources to assist you during this time? Click here.",
                        '/resources',
                        120.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePageButton extends StatelessWidget {
  final title, subheading, routeName, height;

  HomePageButton(this.title, this.subheading, this.routeName, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: height,
      child: RaisedButton(
        shape:
            RoundedRectangleBorder(borderRadius: new BorderRadius.circular(25)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "$title",
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "$subheading",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '$routeName');
        },
      ),
    );
  }
}
