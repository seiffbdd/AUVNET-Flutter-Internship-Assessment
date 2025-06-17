import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';

/// Abstract service class for Firebase Authentication.
abstract class AuthFirebaseService {
  Future<Either<String, String>> signup({required UserModel user});
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  FirebaseAuth auth = FirebaseAuth.instance;

  /// Signs up a user with the provided [UserModel] credentials.
  ///
  /// Returns [Right] with a success message on successful signup.
  /// Returns [Left] with an error message if signup fails.
  @override
  Future<Either<String, String>> signup({required UserModel user}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return right('Signed up succfully');
    } on FirebaseAuthException catch (e) {
      late String errMessage;
      if (e.code == 'weak-password') {
        errMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errMessage = 'The account already exists for that email.';
      }
      debugPrint(errMessage);
      return left(errMessage);
    } catch (e) {
      debugPrint(e.toString());
      return left(e.toString());
    }
  }
}
