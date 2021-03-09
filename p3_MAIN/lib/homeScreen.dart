import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';
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
        body: Padding(
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
                RaisedButton(
                    child: Text("Test Signout Button"),
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/login');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
