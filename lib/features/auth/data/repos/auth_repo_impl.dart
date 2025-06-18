import 'package:dartz/dartz.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/auth/data/data_sources/auth_firebase_service.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<String, String>> signup({required UserModel user}) async {
    return await locator.get<AuthFirebaseService>().signup(user: user);
  }

  @override
  Future<Either<String, String>> login({required UserModel user}) async {
    return await locator.get<AuthFirebaseService>().login(user: user);
  }
}
