import 'package:flutter/material.dart';
import 'resultsPageAUTHORIZED.dart';
import 'resultsPageUNAUTHORIZED.dart';
import 'checkBoxPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: CheckListPageOne(), theme: ThemeData(primaryColor: Colors.white, scaffoldBackgroundColor: Colors.white));
  }
}
