import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Making app bar invisible:
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: <Widget>[
            Text(
              "Settings & Preferences",
              style: Theme.of(context).textTheme.headline1,
            ),
            RaisedButton(
              child: Text("Back to home"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            RaisedButton(
                child: Text("Test Signout Button"),
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/login');
                }),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
