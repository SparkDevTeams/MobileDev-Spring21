import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'package:firebase_core/firebase_core.dart';

import 'loginScreen.dart';
import 'package:p3_MAIN/homeScreen.dart';
import './settings/settingsPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/settings': (context) => SettingsPage()
      },
      theme: ThemeData(
          textTheme: TextTheme(
              headline1: TextStyle(
                  //let headline 1 be the title for each page
                  fontSize: 36,
                  color: AppTheme.Colors.blueFIU,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  fontSize: 15,
                  color: AppTheme.Colors.blueFIU,
                  fontWeight: FontWeight.w400),
              subtitle1: TextStyle(
                  fontSize: 13,
                  color: AppTheme.Colors.blueFIU,
                  fontWeight: FontWeight.w400))),
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}
