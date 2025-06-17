import 'package:get_it/get_it.dart';
import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setup() async {
  // Get an instance of SharedPreferences (used for local key-value storage)
  final sharedPrefs = await SharedPreferences.getInstance();

  locator.registerSingleton<SharedPrefsHelper>(SharedPrefsHelper(sharedPrefs));
}
