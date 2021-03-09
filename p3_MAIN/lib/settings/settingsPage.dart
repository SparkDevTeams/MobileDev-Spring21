import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Making app bar invisible:
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("SettingsPage"),
            RaisedButton(
              child: Text("Back to home"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
            // Inside this column => children of column,
            // you can have multiple widgets inside. Then it
            // stacks from top down.
            // depending on the page, you might have to use
            //stacked widget.
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
