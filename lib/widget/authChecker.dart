import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_email_password/screens/authScreen.dart';
import 'package:firebase_auth_email_password/screens/homeScreen.dart';
import 'package:firebase_auth_email_password/service/authService.dart';
import 'package:flutter/material.dart';

class AuthChecker extends StatelessWidget {
  final authInstance = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStatus,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.data?.uid == null) {
            return AuthScreen();
          } else {
            return HomeScreen();
          }
        }
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}
