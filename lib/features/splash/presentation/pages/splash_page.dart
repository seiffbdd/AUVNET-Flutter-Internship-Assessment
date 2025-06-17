import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/config/assets/app_images.dart';
import 'package:nawel/config/routes/app_router.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/storage/shared_prefs_helper.dart';
import 'package:nawel/core/utils/service_locator.dart';

/// The SplashPage widget represents the initial screen of the app.
/// It displays the app logo centered on the screen.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (locator.get<SharedPrefsHelper>().isOnboardingCompleted()) {
          context.goNamed(AppRouter.loginPageName);
        } else {
          context.goNamed(AppRouter.onboardingPageName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.black),
          ),
          child: Image.asset(
            AppImages.appLogo,
            height:
                MediaQuery.of(context).size.height *
                .41, // Responsive height using MediaQuery
            width:
                MediaQuery.of(context).size.height *
                .41, // Using height value for width ensures a square shape
          ),
        ),
      ),
    );
  }
}
