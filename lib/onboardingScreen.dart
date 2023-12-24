import 'package:flutter/material.dart';
import 'constants/colors.dart' as local_colors;
import 'widgets/InputBar.dart' as input_bar;
import 'widgets/LoginButton.dart' as login_button;
import 'widgets/RegisterButton.dart' as register_button;
import 'widgets/MatchMeowLogo.dart' as logo;
import 'HomeScreen.dart';

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: local_colors.whiteColor,
                            isDense: true, // Added this
                            contentPadding:
                                const EdgeInsets.all(8), // Added this
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            hintText: "Mail",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: TextField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: local_colors.whiteColor,
                              isDense: true, // Added this
                              contentPadding:
                                  const EdgeInsets.all(8), // Added this
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              hintText: "Şifre",
                            ),
                            obscureText: true,
                          ),
                        )),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeScreen(),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(30.0),
                              child: Ink(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      color: local_colors.whiteColor),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: const Center(
                                    child: Text(
                                      "Giriş Yap",
                                      style: TextStyle(
                                          color: local_colors.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
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
              bottom: 20, // Adjusted position
              right: 20, // Adjusted position
              child: Container(
                width: 200, // Adjusted size
                height: 200, // Adjusted size
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  'assets/gifs/cat-dog-hello.GIF',
                  width: 300, // You can adjust if needed
                  height: 300, // You can adjust if needed
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
