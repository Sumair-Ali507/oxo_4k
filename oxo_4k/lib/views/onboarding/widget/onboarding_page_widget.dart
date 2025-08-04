import 'package:flutter/material.dart';
import 'package:oxo_4k/views/onboarding/widget/onboarding_page.dart';
import '../../../config/routes/routes_name.dart';

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage page;
  final bool isLastPage;

  const OnboardingPageWidget({
    super.key,
    required this.page,
    this.isLastPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Centered Image Container (unchanged)
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: Center(
              child: Image.asset(
                page.imagePath,
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Content Section
          if (isLastPage) ...[
            _buildContinueButton(context),
            const SizedBox(height: 100), // Specific 50px gap for last page
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: _buildLastPageDescription(),
            ),
          ] else ...[
            if (page.title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  page.title,
                  style: page.titleStyle ?? const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF14181B),
                    letterSpacing: 0.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            if (page.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  page.description,
                  style: page.descriptionStyle ?? const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ],
          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildLastPageDescription() {
    // Split the description into parts
    final textParts = page.description.split('camera WiFi');
    final beforeText = textParts[0];
    final highlightText = textParts.length > 1 ? 'camera WiFi' : '';

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF6B7280),
          fontWeight: FontWeight.w500,
          height: 1.5,
        ),
        children: [
          TextSpan(text: beforeText),
          if (highlightText.isNotEmpty) ...[
            const WidgetSpan(child: SizedBox(width: 0)), // Forces line break
            WidgetSpan(
              child: Center(
                child: Text(
                  highlightText,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Button remains completely unchanged
  Widget _buildContinueButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.homeScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFEF4639),
          minimumSize: Size(
            MediaQuery.of(context).size.width * 0.6,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text(
          'Looking for camera...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}