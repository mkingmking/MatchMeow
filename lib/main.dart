import 'package:flutter/material.dart';
import 'onboardingScreen.dart' as onboarding_screen;

void main() async {
  runApp(
    const MaterialApp(
        home: Scaffold(
      body: onboarding_screen.OnboardingScreen(),
    )),
  );
}

// Image.asset('assets/gifs/cat-dog-hello.GIF'),
