import 'package:get_it/get_it.dart';
import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:nawel/features/auth/data/data_sources/auth_firebase_service.dart';
import 'package:nawel/features/auth/data/repos/auth_repo_impl.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';
import 'package:nawel/features/auth/domain/use_cases/login_use_case.dart';
import 'package:nawel/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:nawel/features/home/data/data_sources/firebase_firestore_service.dart';
import 'package:nawel/features/home/data/repos/home_repo_impl.dart';
import 'package:nawel/features/home/domain/repos/home_repo.dart';
import 'package:nawel/features/home/domain/use_cases/fetch_services_use_case.dart';
import 'package:nawel/features/splash/data/data_sources/splash_firebase_service.dart';
import 'package:nawel/features/splash/data/repos/splash_repo_impl.dart';
import 'package:nawel/features/splash/domain/repos/splash_repo.dart';
import 'package:nawel/features/splash/domain/use_cases/listen_to_auth_changes_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // Get an instance of SharedPreferences (used for local key-value storage)
  final sharedPrefs = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPrefsHelper>(SharedPrefsHelper(sharedPrefs));

  // Services

  locator.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  locator.registerSingleton<SplashFirebaseService>(SplashFirebaseServiceImpl());

  locator.registerSingleton<FirebaseFirestoreService>(
    FirebaseFirestoreServiceImpl(),
  );

  // repos

  locator.registerSingleton<AuthRepo>(AuthRepoImpl());

  locator.registerSingleton<SplashRepo>(SplashRepoImpl());

  locator.registerSingleton<HomeRepo>(HomeRepoImpl());

  // UseCases

  locator.registerSingleton<SignupUseCase>(SignupUseCase());

  locator.registerSingleton<LoginUseCase>(LoginUseCase());

  locator.registerSingleton<ListenToAuthChangesUseCase>(
    ListenToAuthChangesUseCase(),
  );
  locator.registerSingleton<FetchServicesUseCase>(FetchServicesUseCase());
}
