import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nawel/config/theme/app_colors.dart';
import 'package:nawel/core/widgets/custom_bottom_nav_bar.dart';
import 'package:nawel/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:nawel/features/home/presentation/widgets/build_page_view.dart';
import 'package:nawel/features/home/presentation/widgets/code_banner.dart';
import 'package:nawel/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:nawel/features/home/presentation/widgets/resturant_column.dart';
import 'package:nawel/features/home/presentation/widgets/services_section.dart';
import 'package:nawel/features/home/presentation/widgets/shortcuts_section.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    _fetchServices();
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
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                'Services:',
                style: GoogleFonts.dmSans(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(height: 150, child: const ServicesSection()),
            const CodeBanner(),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                'Shortcuts:',
                style: GoogleFonts.dmSans(
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(height: 100, child: ShortcutsSection()),
            BuildPageView(pageController: _pageController),
            Center(
              child: SmoothPageIndicator(controller: _pageController, count: 6),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 19.0),
              child: Text(
                'Popular restaurants nearby',
                style: GoogleFonts.dmSans(
                  textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColors.darkGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ResturantColumn(
                    image:
                        'https://static.vecteezy.com/system/resources/previews/052/792/818/non_2x/restaurant-logo-design-vector.jpg',
                    title: 'Allo Beirut ',
                    time: '32 mins',
                  );
                },
              ),
            ),

            const SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchServices() async {
    await context.read<HomeCubit>().fetchServices();
  }
}
