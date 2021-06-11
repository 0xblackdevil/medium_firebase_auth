import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _initFirebaseAuth = FirebaseAuth.instance;

  Stream<User?> get userStatus => _initFirebaseAuth.authStateChanges();
}
