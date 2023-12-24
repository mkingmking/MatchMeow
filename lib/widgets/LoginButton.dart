import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;
import '../HomeScreen.dart' as home_screen;

class LoginButton extends StatelessWidget {
  const LoginButton(this.buttonText, {Key? key});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const home_screen.HomeScreen(),
              ),
            );
          },
          borderRadius: BorderRadius.circular(30.0),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(color: local_colors.whiteColor),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(color: local_colors.whiteColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
