import 'package:flutter/material.dart';
import 'constants/colors.dart' as local_colors;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        color: local_colors.mainColor,
      ),
      child: const Center(
        child: SizedBox(
          width: 250,
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            // Mail field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: local_colors.whiteColor,
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8), // Added this
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Mailinizi giriniz',
                ),
              ),
            ),
            // Password field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: local_colors.whiteColor,
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8), // Added this
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  hintText: 'Şifrenizi giriniz',
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
