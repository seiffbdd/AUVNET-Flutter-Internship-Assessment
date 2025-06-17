import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  final SharedPreferences _prefs;

  SharedPrefsHelper(this._prefs);

  // Onboarding
  Future<void> setOnboardingCompleted(bool completed) async {
    await _prefs.setBool('onboarding_completed', completed);
  }

  bool isOnboardingCompleted() {
    return _prefs.getBool('onboarding_completed') ?? false;
  }
}
