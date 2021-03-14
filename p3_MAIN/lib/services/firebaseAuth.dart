import 'package:firebase_auth/firebase_auth.dart';

class AuthFunctions {
  Future<void> signIn() async {
    final formState = _formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        User user = (await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _pantherid, password: _password))
            .user;
        print(user.uid);
        await DatabaseService(authID: user.uid);
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        print(e.message);
      }

      // login to firebase
    }
  }
}
