import 'package:flutter/material.dart';

class OnboardingPage {
  final String imagePath;
  final String title;
  final String description;
  final bool isLastPage;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
    this.isLastPage = false,
    TextStyle? titleStyle,
    TextStyle? descriptionStyle,
  }) :
        titleStyle = titleStyle ?? const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Color(0xFF14181B),
        ),
        descriptionStyle = descriptionStyle ?? const TextStyle(
          fontSize: 12,
          color: Color(0xFF6B7280),
          height: 1.5,
        );
}