import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashRepo {
  Stream<User?> authStateStream();
}
