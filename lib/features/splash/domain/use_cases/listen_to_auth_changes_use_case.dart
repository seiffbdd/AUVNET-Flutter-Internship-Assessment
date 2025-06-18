import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/splash/domain/repos/splash_repo.dart';

class ListenToAuthChangesUseCase {
  Stream<User?> call() {
    return locator.get<SplashRepo>().authStateStream();
  }
}
