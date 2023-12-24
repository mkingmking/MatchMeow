import 'package:flutter/material.dart';
import 'onboardingScreen.dart' as onboarding_screen;
import 'homeScreen.dart' as home_screen;

void main() async {
  runApp(
    const MaterialApp(
      home: onboarding_screen.OnboardingScreen(),
    ),
  );
}
