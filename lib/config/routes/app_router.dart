import 'package:go_router/go_router.dart';
import 'package:nawel/features/splash/pages/splash_page.dart';

abstract class AppRouter {
  static const splashPageName = 'splashPage';
  static const splashPagePath = '/';
  static final router = GoRouter(
    routes: [
      GoRoute(
        name: splashPageName,
        path: splashPagePath,
        builder: (context, state) => SplashPage(),
      ),
    ],
  );
}
