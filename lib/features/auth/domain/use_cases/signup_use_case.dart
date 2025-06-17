import 'package:dartz/dartz.dart';
import 'package:nawel/core/use_case/usecase.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/auth/data/models/user_model.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';

class SignupUseCase implements Usecase<Either<String, String>, UserModel> {
  @override
  Future<Either<String, String>> call({UserModel? params}) async {
    return await locator.get<AuthRepo>().signup(user: params!);
  }
}
