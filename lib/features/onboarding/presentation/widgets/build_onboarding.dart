import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nawel/config/assets/app_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/routes/app_router.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/widgets/default_elevated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nawel/features/onboarding/data/data_sources/onboarding_local_data_source.dart';

class BuildOnboarding extends StatelessWidget {
  const BuildOnboarding({
    super.key,
    this.title,
    this.subTitle,
    required this.pageController,
    this.isLastOnboardingPage = false,
  });
  final String? title;
  final String? subTitle;
  final PageController pageController;
  final bool isLastOnboardingPage;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        // Top-left decorative background image
        Positioned(
          top: -20,
          left: -104,
          child: Image.asset(
            'assets/images/Ellipse 153.jpg',
            height:
                MediaQuery.of(context).size.height *
                .41, // Responsive height using MediaQuery
            width: MediaQuery.of(context).size.height * .41,
          ),
        ),
        // Bottom-right decorative background image
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/images/bg.jpg',
            height: screenHeight * 0.26,
            width: screenHeight * 0.26,
          ),
        ),
        // Main content: logo, title, subtitle, buttons'
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.11),
              // App logo centered in the layout
              Image.asset(
                AppImages.appLogo,
                height: screenHeight * 0.41,
                width:
                    screenHeight *
                    0.41, // Using height value for width ensures a square shape
              ),
              const Spacer(),
              // Onboarding title text
              Text(
                '$title',
                style: GoogleFonts.rubik(
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 11.h),

              // Onboarding subtitle text
              Text(
                '$subTitle',
                style: GoogleFonts.rubik(
                  textStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: AppColors.slateBlue,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),

              // Main action button: "Get Started"
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.78,
                child: DefaultElevatedButton(
                  text: 'Get Started',
                  onPressed: () {
                    context.goNamed(AppRouter.loginPageName);

                    OnboardingLocalDataSource.completeOnboarding();
                  },
                ),
              ),
              const SizedBox(height: 4.0),

              // Secondary navigation button: "Next"
              TextButton(
                onPressed: () {
                  if (!isLastOnboardingPage) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  } else {
                    context.goNamed(AppRouter.loginPageName);
                    OnboardingLocalDataSource.completeOnboarding();
                  }
                },
                child: Text(
                  'Next',
                  style: GoogleFonts.rubik(
                    textStyle: Theme.of(context).textTheme.displaySmall!
                        .copyWith(color: AppColors.slateBlue),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
