import 'package:flutter/widgets.dart';

class BuildPageView extends StatelessWidget {
  const BuildPageView({super.key, required PageController pageController})
    : _pageController = pageController;

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 24.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Image.asset(
              'assets/images/photo_2023-09-03_13-36-55 1.png',
              fit: BoxFit.fill,
            );
          },
        ),
      ),
    );
  }
}
