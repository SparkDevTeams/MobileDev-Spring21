import 'package:flutter/material.dart';
import 'package:p3_MAIN/theme/themeData.dart';

class ExposureThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: IconButton(
            color: AppTheme.Colors.blueFIU,
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(children: [
                Text(
                  "Thank You for Submitting.",
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  "Thank you for submitting and we hope you get well soon. Moreover, thank you for taking the steps and precautions to protect your fellow Panthers.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Container(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                          color: AppTheme.Colors.brightGoldFIU,
                          child: Text(
                            "Resources & Information",
                            style: TextStyle(
                                fontSize: 20, color: AppTheme.Colors.blueFIU),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/resources');
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        child: RaisedButton(
                          color: Colors.grey,
                          child: Text(
                            "Back to home",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            // TODO add the other Navigator pop when the first page is added.
                            // Navigator.pop(context);
                          },
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
        ));
  }
}
