import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:nawel/core/utils/service_locator.dart';

/// Uses [SharedPrefsHelper] to persist onboarding completion status.
abstract class OnboardingLocalDataSource {
  static final SharedPrefsHelper _prefsHelper = locator<SharedPrefsHelper>();

  static Future<void> completeOnboarding() async {
    await _prefsHelper.setOnboardingCompleted(true);
  }

  /// Reverts onboarding completion, setting the flag to false in shared preferences.
  static Future<void> cancelCompleteOnboarding() async {
    await _prefsHelper.setOnboardingCompleted(false);
  }

  static bool isOnboardingCompleted() {
    return _prefsHelper.isOnboardingCompleted();
  }
}
