import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/features/auth/presentation/pages/login_page.dart';
import 'package:nawel/features/auth/presentation/pages/signup_page.dart';
import 'package:nawel/features/auth/presentation/view_models/login_bloc/login_bloc.dart';
import 'package:nawel/features/auth/presentation/view_models/signup_bloc/signup_bloc.dart';
import 'package:nawel/features/home/presentation/pages/home_page.dart';
import 'package:nawel/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:nawel/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:nawel/features/splash/presentation/pages/splash_page.dart';
import 'package:nawel/features/splash/presentation/view_models/splash_cubit/splash_cubit.dart';

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

  static const homePageName = 'homePage';
  static const homePagePath = '/homePage';

  /// The main router configuration using `go_router`.
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: splashPageName,
        path: splashPagePath,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SplashCubit(),
              child: SplashPage(),
            ),
      ),
      GoRoute(
        name: onboardingPageName,
        path: onboardingPagePath,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        name: loginPageName,
        path: loginPagePath,
        builder:
            (context, state) => BlocProvider(
              create: (context) => LoginBloc(),
              child: LoginPage(),
            ),
      ),
      GoRoute(
        name: signupPageName,
        path: signupPagePath,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SignupBloc(),
              child: SignupPage(),
            ),
      ),
      GoRoute(
        name: homePageName,
        path: homePagePath,
        builder:
            (context, state) => BlocProvider(
              create: (context) => HomeCubit(),
              child: HomePage(),
            ),
      ),
    ],
  );
}
