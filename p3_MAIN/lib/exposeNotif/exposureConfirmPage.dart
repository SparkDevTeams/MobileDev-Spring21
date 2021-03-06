import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'exposureThankyou.dart';
import 'databaseFunction.dart';

class ExposureConfirmation extends StatefulWidget {
  final String exposureID;

  const ExposureConfirmation({Key key, this.exposureID}) : super(key: key);

  @override
  _ExposureConfirmationState createState() => _ExposureConfirmationState();
}

class _ExposureConfirmationState extends State<ExposureConfirmation> {
  final CollectionReference userDataCollection =
      FirebaseFirestore.instance.collection('exposed_id');

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User user = auth.currentUser;
    bool _initCheckbox = false;
    String _exposureID = widget.exposureID;

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
                Text("Exposure Notifications",
                    style: Theme.of(context).textTheme.headline1),
                Text(
                    "Before you submit please make sure you are sure that you are experiencing symptoms and/or tested positive within the last two weeks.",
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppTheme.Colors.blueFIU,
                      borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          "When you click ???Submit,??? students that have been in close proximity with you that has this app will be notified that they have been potentially exposed to COVID-19.",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "However, the system will not tell who exposed them. Therefore, your identity will remain private. It is in our best interest to preserve the identity of our infected Panthers.",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      //color: AppTheme.Colors.blueFIU,
                      borderRadius: BorderRadius.circular(25)),
                  child: DottedBorder(
                    dashPattern: [6, 4],
                    color: AppTheme.Colors.magentaFIU,
                    strokeWidth: 2,
                    borderType: BorderType.RRect,
                    radius: Radius.circular(25),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Text(
                            "By clicking this checkbox below and submitting, you acknowlege you have read this information and you will take the necessary steps to preserve the your safety and other???s safety.",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Container(
                              width: 220,
                              child: StatefulBuilder(builder:
                                  (BuildContext context, StateSetter setState) {
                                return CheckboxListTile(
                                  activeColor: AppTheme.Colors.blueFIU,
                                  value: _initCheckbox,
                                  onChanged: (bool value) {
                                    setState(() {
                                      _initCheckbox = value;
                                    });
                                  },
                                  title: Text(
                                    "I Agree",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 55,
                  width: 180,
                  child: RaisedButton(
                    color: AppTheme.Colors.blueFIU,
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      print(user.uid);
                      // TODO, on pressed, take authID and send to exposed_id collection.
                      if (_initCheckbox != true) {
                        print("Please select I agree");
                        return showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                  title: Text("Acknowlegements"),
                                  content: Text(
                                    "Please click the checkbox to agree and acknowlege that you have read this information.",
                                  ),
                                  actions: [
                                    FlatButton(
                                      // button to exit alert dialog
                                      child: Text("Continue"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ]);
                            });
                      } else {
                        // TODO push exposure ID to the document
                        DatabaseService(authID: user.uid)
                            .sendexposure(exposureID: "Exposed");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExposureThankYouPage()));
                      }
                      //TODO: Send UID with other docs to database
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
              ])),
        ));
  }
}
