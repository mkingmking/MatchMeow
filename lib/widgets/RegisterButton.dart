import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class RegisterButton extends StatelessWidget {
  const RegisterButton(this.buttonText, {super.key});

  final String buttonText;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Hesabınız yok mu?",
          style: TextStyle(color: local_colors.whiteColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: OutlinedButton(
            onPressed: null,
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
              side: MaterialStateProperty.all(const BorderSide(
                  color: local_colors
                      .whiteColor)), // Set the outline color to white
            ),
            child: Text(buttonText,
                style: const TextStyle(color: local_colors.whiteColor)),
          ),
        ),
      ],
    );
  }
}
