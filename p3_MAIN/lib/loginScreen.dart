import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/loginLogoV1.png'),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Sign In:",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 10,
                ),
                UserPassLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserPassLogin extends StatelessWidget {
  const UserPassLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
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
          TextField(
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
                "Login",
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
    );
  }
}
