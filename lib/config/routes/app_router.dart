import 'package:go_router/go_router.dart';
import 'package:nawel/features/auth/presentation/pages/login_page.dart';
import 'package:nawel/features/auth/presentation/pages/signup_page.dart';
import 'package:nawel/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:nawel/features/splash/presentation/pages/splash_page.dart';

/// A centralized class to manage the application's route configuration.
abstract class AppRouter {
  static const splashPageName = 'splashPage';
  static const splashPagePath = '/';

  static const onboardingPageName = 'onboardingPage';
  static const onboardingPagePath = '/onboardingPage';

  static const loginPageName = 'loginPage';
  static const loginPagePath = '/loginPage';

  static const signupPageName = 'signupPage';
  static const signupPagePath = '/signupPage';

  /// The main router configuration using `go_router`.
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: splashPageName,
        path: splashPagePath,
        builder: (context, state) => SplashPage(),
      ),
      GoRoute(
        name: onboardingPageName,
        path: onboardingPagePath,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        name: loginPageName,
        path: loginPagePath,
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        name: signupPageName,
        path: signupPagePath,
        builder: (context, state) => SignupPage(),
      ),
    ],
  );
}
