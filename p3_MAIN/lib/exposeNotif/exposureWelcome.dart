import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'exposureConfirmPage.dart';
import 'fetchFirebaseData.dart';
import 'exposedListInfo.dart';

class ExposureWelcomeScreen extends StatefulWidget {
  @override
  _ExposureWelcomeScreenState createState() => _ExposureWelcomeScreenState();
}

class _ExposureWelcomeScreenState extends State<ExposureWelcomeScreen> {
  List<ExposedUsers> exposedUser = [
    ExposedUsers(userID: 'None', date: "3-23-2021", time: '14:24'),
    ExposedUsers(userID: 'None', date: "2-03-2021", time: '09:37')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Text("Exposure Notifications",
                style: Theme.of(context).textTheme.headline1),
            Text(
              "In this tab, you will find your history of potential contact with people on campus who have tested positive for Covid-19 in the past two days.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notify us",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.Colors.blueFIU),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 140,
                    width: 400,
                    child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ExposureConfirmation()));
                        },
                        child: Text(
                          "I have tested POSITIVE and or showing symptoms of COVID-19 and would like to anonymously notify anyone that has been in contact with me in the last 14 days.",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        color: AppTheme.Colors.magentaFIU,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(25))),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "History of Exposures:",
                          style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.Colors.blueFIU),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            width: 400,
                            height: 320,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25)),
                            child: DottedBorder(
                              dashPattern: [6, 4],
                              color: AppTheme.Colors.magentaFIU,
                              strokeWidth: 2,
                              borderType: BorderType.RRect,
                              radius: Radius.circular(25),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ListView.builder(
                                    itemCount: exposedUser.length,
                                    itemBuilder: (context, index) {
                                      return Card(
                                        child: ListTile(
                                          // TODO format to be nicer, also fetch data
                                          title: Text(
                                            'Date: ' +
                                                exposedUser[index].date +
                                                "     ||     Time: " +
                                                exposedUser[index].time,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      );
                                    },
                                  ) // TODO Make list of exposures!!),
                                  ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
