import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

abstract class SplashFirebaseService {
  Stream<User?> listenToFirebaseChanges();
}

class SplashFirebaseServiceImpl extends SplashFirebaseService {
  @override
  Stream<User?> listenToFirebaseChanges() {
    try {
      return FirebaseAuth.instance.authStateChanges();
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
