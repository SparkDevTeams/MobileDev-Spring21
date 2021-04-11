import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:p3_MAIN/theme/themeData.dart';
import 'homeScreen.dart';
import './services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _pantherid, _firstName, _lastName, _password, _passwordConfirmation;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppTheme.Colors.blueFIU),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Form(
                key: _formkey,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Register for P3",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Please enter your Panther Email";
                          } else if (input.contains(".") &&
                              input.contains("@")) {
                            return null;
                          } else {
                            return "Invalid email Address";
                          }
                        },
                        onSaved: (input) => _pantherid = input,
                        // USERNAME
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            hintText: "Panther Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: AppTheme.Colors.brightGoldFIU,
                              ),
                            )),
                      ),
                      SizedBox(
                        // Spacing between widgets
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Please enter your first name.";
                          }
                        },
                        onSaved: (input) => _firstName = input,
                        // USERNAME
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            hintText: "First Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: AppTheme.Colors.brightGoldFIU,
                              ),
                            )),
                      ),
                      SizedBox(
                        // Spacing between widgets
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Please enter your last name.";
                          }
                        },
                        onSaved: (input) => _lastName = input,
                        // USERNAME
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(
                                color: AppTheme.Colors.brightGoldFIU,
                              ),
                            )),
                      ),
                      SizedBox(
                        // Spacing between widgets
                        height: 10,
                      ),
                      TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please re-enter your password.";
                            }
                          },
                          onSaved: (input) {
                            _password = input;
                            return _password;
                          },
                          // PASSWORD
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: AppTheme.Colors.brightGoldFIU,
                                ),
                              ))),
                      SizedBox(
                        // Spacing between widgets
                        height: 10,
                      ),
                      TextFormField(
                          validator: (input) {
                            _passwordConfirmation = input;
                            if (_passwordConfirmation.isEmpty) {
                              return "Please re-enter your password.";
                            }
                          },
                          onSaved: (input) => _passwordConfirmation = input,
                          // PASSWORD
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: AppTheme.Colors.brightGoldFIU,
                                ),
                              ))),
                      SizedBox(
                        // Spacing between widgets
                        height: 20,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        child: RaisedButton(
                          color: AppTheme.Colors.brightGoldFIU,
                          child: Text(
                            "Register",
                            style: TextStyle(
                                fontSize: 20, color: AppTheme.Colors.blueFIU),
                          ),
                          onPressed: register,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Send data to firebase

  Future<void> register() async {
    String exposureNotifID;

    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!';
    Random _rnd = Random.secure();

    String getRandomString(int length) =>
        String.fromCharCodes(Iterable.generate(
            length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

    exposureNotifID = getRandomString(20);
    Navigator.pop(context);

    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _pantherid, password: _password);

        await DatabaseService(authID: userCredential.user.uid).updateUserData(
            _pantherid, _firstName, _lastName, exposureNotifID, null, null);
        // TODO: take Database service out of login method.
      } catch (e) {
        print(e.message);
      }
      // login to firebase
    }
  }
}
