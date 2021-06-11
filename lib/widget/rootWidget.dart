import 'package:firebase_auth_email_password/widget/authChecker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class RootWidget extends StatelessWidget {
  final firebaseInit = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: firebaseInit,
      builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AuthChecker();
        }
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text(snapshot.error.toString())));
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
