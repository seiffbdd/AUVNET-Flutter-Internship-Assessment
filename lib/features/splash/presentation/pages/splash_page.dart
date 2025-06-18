import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/config/assets/app_images.dart';
import 'package:nawel/config/routes/app_router.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/features/splash/presentation/view_models/splash_cubit/splash_cubit.dart';

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
    _startAuthListen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is OnboardingNotFinished) {
          context.goNamed(AppRouter.onboardingPageName);
        }
        if (state is UserNotAutenticated) {
          log('user not authenticated');

          context.goNamed(AppRouter.loginPageName);
        }
        if (state is UserAutenticated) {
          log('user authenticated');
          context.goNamed(AppRouter.homePageName);
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  Future<void> _startAuthListen() async {
    await context.read<SplashCubit>().startAuthListen();
  }
}
