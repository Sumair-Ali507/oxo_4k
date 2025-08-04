import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:oxo_4k/core/constants/assets_path.dart';
import 'package:oxo_4k/views/onboarding/widget/onboarding_page.dart';
import 'package:oxo_4k/views/onboarding/widget/onboarding_page_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      imagePath: AssetPaths.onboardingTwo,
      title: 'Turn on camera',
      titleStyle: TextStyle(
        color: Color(0xff14181B),
        fontSize: 14,
        fontWeight: FontWeight.normal
      ),
      description: '',
    ),
    OnboardingPage(
      imagePath: AssetPaths.onboardingThree,
      title: 'Connect device to Camera WiFi',
      titleStyle: TextStyle(
          color: Color(0xff14181B),
          fontSize: 14,
          fontWeight: FontWeight.normal
      ),

      description: 'Default WiFi password: 12345678',

    ),
    OnboardingPage(
      imagePath: AssetPaths.onboardingOne,
      title: '',
      description: 'Please make sure you\'re connected to the camera WiFi',
      isLastPage: true,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingPageWidget(
                  page: _pages[index],
                  isLastPage: _pages[index].isLastPage,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: _buildPageIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageIndicator() {
    return SmoothPageIndicator(
      controller: _pageController,
      count: _pages.length,
      effect: const SlideEffect(
        spacing: 8.0,
        radius: 8.0,
        dotWidth: 8.0,
        dotHeight: 8.0,
        dotColor: Color(0x4C838383),
        activeDotColor: Color(0xFFEF4A39),
        paintStyle: PaintingStyle.fill,
      ),
    );
  }
}