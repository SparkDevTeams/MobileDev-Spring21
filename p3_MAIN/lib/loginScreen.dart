import 'package:flutter/material.dart';

// TODO: change into stateful widget

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _pantherid, _password;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Form(
            key: _formkey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/loginLogoV1.png',
                    width: 300,
                    scale: 1.5,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Sign In:",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return "Enter Valid ID";
                      }
                    },
                    onSaved: (input) => _pantherid = input,
                    // USERNAME
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                        hintText: "Panther ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                            color: Colors.amber,
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
                      onSaved: (input) => _password = input,
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
                              color: Colors.amber,
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
                      color: Colors.amber,
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        return null;
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

/*
  void signIn() {
    final _form = _formkey.currentState;
    if (_formkey.validate()) {
      // login to firebase
    }
  }

*/
}
