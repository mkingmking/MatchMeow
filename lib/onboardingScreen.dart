import 'package:flutter/material.dart';
import 'constants/colors.dart' as local_colors;
import 'widgets/InputBar.dart' as input_bar;
import 'widgets/LoginButton.dart' as login_button;
import 'widgets/RegisterButton.dart' as register_button;
import 'widgets/MatchMeowLogo.dart' as logo;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: local_colors.mainColor,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
              top: 0, // Adjust the position as needed
              child: logo.Logo(true, false),
            ),
            Positioned(
              top: 200,
              child: SizedBox(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Kullanıcı Girişi",
                      style: TextStyle(
                        color: local_colors.whiteColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: local_colors.whiteColor,
                      margin: const EdgeInsets.only(bottom: 10),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: input_bar.InputBar('Mail'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: input_bar.InputBar('Şifre'),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Şifremi unuttum",
                          style: TextStyle(
                              color: local_colors.whiteColor,
                              decoration: TextDecoration.underline,
                              decorationColor: local_colors.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: login_button.LoginButton('Giriş Yap'),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: register_button.RegisterButton('Üye Ol'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: -50, // Adjust the position as needed
              right: -50, // Adjust the position as needed
              child: Container(
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/gifs/cat-dog-hello.GIF',
                  width: 100, // Adjust the width of the image as needed
                  height: 100, // Adjust the height of the image as needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
