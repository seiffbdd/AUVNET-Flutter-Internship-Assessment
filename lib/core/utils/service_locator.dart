import 'package:get_it/get_it.dart';
import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:nawel/features/auth/data/data_sources/auth_firebase_service.dart';
import 'package:nawel/features/auth/data/repos/auth_repo_impl.dart';
import 'package:nawel/features/auth/domain/repos/auth_repo.dart';
import 'package:nawel/features/auth/domain/use_cases/signup_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // Get an instance of SharedPreferences (used for local key-value storage)
  final sharedPrefs = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPrefsHelper>(SharedPrefsHelper(sharedPrefs));

  // Services
  locator.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // repos

  locator.registerSingleton<AuthRepo>(AuthRepoImpl());

  // UseCases

  locator.registerSingleton<SignupUseCase>(SignupUseCase());
}
