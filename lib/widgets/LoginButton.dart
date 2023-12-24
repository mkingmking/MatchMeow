import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;

class LoginButton extends StatelessWidget {
  const LoginButton(this.buttonText, {super.key});

  final String buttonText;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: OutlinedButton(
        onPressed: null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
          side: MaterialStateProperty.all(const BorderSide(
              color:
                  local_colors.whiteColor)), // Set the outline color to white
        ),
        child: Text(buttonText,
            style: const TextStyle(color: local_colors.whiteColor)),
      ),
    );
  }
}
