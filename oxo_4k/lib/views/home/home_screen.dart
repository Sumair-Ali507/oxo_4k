import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oxo_4k/config/routes/routes_name.dart';

import 'business_logic/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.showCarousel = true});

  final bool showCarousel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: _HomeScreenContent(showCarousel: showCarousel),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent({required this.showCarousel});

  final bool showCarousel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(
            children: [
              _buildCameraPreview(context),
              _buildTopBar(context),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return state.showCarousel
                      ? _buildCarousel(context, state)
                      : const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCameraPreview(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          'https://picsum.photos/seed/562/600',
          width: screenSize.width,
          height: screenSize.height * 0.3,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: screenSize.height * 0.02,
      left: screenSize.width * 0.05,
      right: screenSize.width * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.settings_sharp,
              color: Colors.white,
              size: screenSize.width * 0.06,
            ),
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF1E1E1E),
              padding: EdgeInsets.all(screenSize.width * 0.03),
              shape: const CircleBorder(),
            ),
            onPressed: () {
             Navigator.pushNamed(context, RoutesName.settingsScreen);
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '27/64Gb',
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Colors.white,
                  fontSize: screenSize.width * 0.04,
                ),
              ),
              Text(
                '4k/30fps',
                style: TextStyle(
                  fontFamily: GoogleFonts.inter().fontFamily,
                  color: Colors.white,
                  fontSize: screenSize.width * 0.04,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return const SizedBox.shrink();
  }

  Widget _buildCarousel(BuildContext context, HomeState state) {
    final screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: screenSize.height * 0.05,
      left: screenSize.width * 0.1,
      right: screenSize.width * 0.1,
      child: SizedBox(
        height: screenSize.height * 0.15,
        child: CarouselSlider(
          options: CarouselOptions(
            initialPage: state.carouselIndex,
            viewportFraction: 1.0,
            height: screenSize.height * 0.15,
            enableInfiniteScroll: false,
            onPageChanged: (index, _) {
              context.read<HomeBloc>().add(UpdateCarouselIndex(index));
            },
          ),
          items: [
            _buildCarouselItem(
              context,
              title: 'Select Resolution',
              onPressed: () => print('Select Resolution pressed'),
              showSwipeText: true,
            ),
            _buildCarouselItem(
              context,
              title: 'Focus Camera',
              onPressed: () {
                context.read<HomeBloc>().add(const NavigateToFocus());
              },
              showSwipeText: true,
            ),
            _buildCarouselItem(
              context,
              title: 'Set WB',
              onPressed: () {
                context.read<HomeBloc>().add(const OpenWhiteBalanceDialog());
                showDialog(
                  context: context,
                  builder: (dialogContext) => Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () => FocusScope.of(dialogContext).unfocus(),
                      child: _WhiteBalanceDialog(),
                    ),
                  ),
                );
              },
              showSwipeText: true,
            ),
            _buildCarouselItem(
              context,
              title: 'Done',
              onPressed: () {
                context.read<HomeBloc>().add(const ToggleCarouselVisibility(false));
              },
              showSwipeText: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(
      BuildContext context, {
        required String title,
        required VoidCallback onPressed,
        required bool showSwipeText,
      }) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: screenSize.width * 0.5, // Set button width to 90% of screen width
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: Size(screenSize.width * 0.9, screenSize.height * 0.06),
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.04),
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
            ),
            child: Text(
              title,
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
                fontSize: screenSize.width * 0.04,
              ),
            ),
          ),
        ),
        if (showSwipeText)
          Padding(
            padding: EdgeInsets.all(screenSize.width * 0.01),
            child: Text(
              'Swipe to Continue',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
                fontSize: screenSize.width * 0.03,
              ),
            ),
          ),
      ],
    );
  }
}



class _WhiteBalanceDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.8,
      padding: EdgeInsets.all(screenSize.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'White Balance',
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              color: Colors.white,
              fontSize: screenSize.width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          Text(
            'White Balance settings placeholder',
            style: TextStyle(
              fontFamily: GoogleFonts.inter().fontFamily,
              color: Colors.white,
              fontSize: screenSize.width * 0.04,
            ),
          ),
          SizedBox(height: screenSize.height * 0.02),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Close',
              style: TextStyle(
                fontFamily: GoogleFonts.inter().fontFamily,
                color: Colors.white,
                fontSize: screenSize.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}