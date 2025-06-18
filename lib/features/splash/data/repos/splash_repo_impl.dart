import 'package:firebase_auth/firebase_auth.dart';
import 'package:nawel/core/utils/service_locator.dart';
import 'package:nawel/features/splash/data/data_sources/splash_firebase_service.dart';
import 'package:nawel/features/splash/domain/repos/splash_repo.dart';

class SplashRepoImpl implements SplashRepo {
  @override
  Stream<User?> authStateStream() {
    return locator.get<SplashFirebaseService>().listenToFirebaseChanges();
  }
}
