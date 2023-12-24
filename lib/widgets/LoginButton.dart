/*import 'package:flutter/material.dart';
import '../constants/colors.dart' as local_colors;
import 'package:proje1/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginButton extends StatelessWidget {
  LoginButton(this.buttonText, {Key? key});

  final String buttonText;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        child: ElevatedButton(
          onPressed: () async {
            try {
              

              String email = emailController.text;
              String password = passwordController.text;

              // Firebase Auth sign in
              UserCredential userCredential =
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: email,
                password: password,
              );

              // Navigate to HomeScreen or another page upon successful login
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } on FirebaseAuthException catch (e) {
              // Handle different FirebaseAuth errors here
              if (e.code == 'user-not-found') {
                print('No user found for that email.');
              } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
              }
            } catch (e) {
              print(e); // Handle other errors
            }
          },
          // borderRadius: BorderRadius.circular(30.0),
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

*/