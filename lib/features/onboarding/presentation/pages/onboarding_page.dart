import 'package:flutter/material.dart';
import 'package:nawel/features/onboarding/presentation/widgets/build_onboarding.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // First onboarding screen
          BuildOnboarding(
            title: 'all-in-one delivery',
            subTitle:
                'Order groceries, medicines, and meals delivered straight to your door',
            pageController: _pageController,
          ),
          // Second onboarding screen
          BuildOnboarding(
            title: 'User-to-User Delivery',
            subTitle:
                'Send or receive items from other users quickly and easily',
            pageController: _pageController,
          ),
          // Third onboarding screen
          BuildOnboarding(
            title: 'Sales & Discounts',
            subTitle: 'Discover exclusive sales and deals every day',
            pageController: _pageController,
            isLastOnboardingPage: true,
          ),
        ],
      ),
    );
  }
}
