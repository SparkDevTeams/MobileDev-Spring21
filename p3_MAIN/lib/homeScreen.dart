import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.blue,
          backgroundColor: Colors.transparent,
          title: Text(
            "Testing",
            style: TextStyle(color: AppTheme.Colors.blueFIU),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(onPressed: () {
                  Navigator.popAndPushNamed(context, '/login');
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
