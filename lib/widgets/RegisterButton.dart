import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;
import 'package:proje1/addUserPage.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(this.buttonText, {super.key});

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Hesabınız yok mu?",
          style: TextStyle(color: local_colors.whiteColor),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Material(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                // Handle button tap

                // Navigate to HomeScreen or another page upon successful login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AddUserPage()),
                );
              },
              borderRadius: BorderRadius.circular(30.0),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: local_colors.whiteColor),
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    buttonText,
                    style: const TextStyle(color: local_colors.whiteColor),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
