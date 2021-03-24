import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/colors.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import './UIWidgets/ButtonWidgets.dart';
//import 'package:p3_MAIN/theme/themeData.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  final String exposureId;
  // TODO: pass exposure ID into the exposure notification widget.

  HomeScreen({this.name, this.exposureId});

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
                  onPressed: null),
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
                      "Hello, $name",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    child: Text(
                      "Welcome to FIU's campus! Please be considerate of your safety as well as others!",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        //TODO: PASS in the AuthID to this
                        "Screening Checklist",
                        "Please fill this out before coming on campus! This checklist will determine if you are cleared to go on campus or not.",
                        '/checklist_p1',
                        170.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        //TODO: PASS in the AuthID to this
                        // TODO: When auth ID is obtained, it will refer to the collection
                        "Exposure Notifications",
                        "View your history of exposures of COVID-19 or submit a positive test alert.",
                        null,
                        150.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        "COVID-19 Resources",
                        "Do you need resources to assist you during this time? Click here.",
                        '/resources',
                        150.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: HomePageButton(
                        "On Campus Guidelines",
                        "Please read these listed guidelines before coming on campus.",
                        '/guidelines',
                        150.0),
                  ),
                  SizedBox(
                    height: 50,
                  )
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
        child: Row(
          children: [
            Container(
              width: 170,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "$title",
                          style: TextStyle(
                              color: AppTheme.Colors.blueFIU,
                              fontSize: 26,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      //padding: EdgeInsets.only(top: 15),
                      //color: Colors.amber,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "$subheading",
                        style: TextStyle(
                          color: AppTheme.Colors.blueFIU,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.ac_unit,
                    size: 1.0,
                  )),
              // TODO: Import image assets for each icon...
            ),
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(context, '$routeName');
        },
      ),
    );
  }
}
// TODO: We need to pass Exposure ID into exposure notifications.
