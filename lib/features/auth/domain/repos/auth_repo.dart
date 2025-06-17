import 'package:dartz/dartz.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<String, String>> signup({required UserModel user});
}
