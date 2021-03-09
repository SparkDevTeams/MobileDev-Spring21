// USE: COPY AND PASTE
// Change the name of the widget for the page.

import 'package:flutter/material.dart';

class TheNameOfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          // Making app bar invisible:
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
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
