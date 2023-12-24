import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomeScreen2.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'arayuz/arayuz2.png'), // Make sure this path is correct
            fit: BoxFit.cover, // This will fill the background of the Container
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize:
                  MainAxisSize.min, // Use the minimum space for the column
              mainAxisAlignment: MainAxisAlignment
                  .start, // Align items to the start of the axis
              children: <Widget>[
                // Your form and other widgets here, which will be centered on the screen.
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Mail',
                      labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 181, 191,
                              182)), // Changes the color of the label text
                      fillColor: Color.fromARGB(255, 247, 247,
                          246), // Changes the fill color of the text field
                      filled:
                          true, // Don't forget to set this to true to activate the fillColor
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 202, 25, 9)), // Normal border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 227, 31,
                                5)), // Normal border color when the TextFormField is enabled but not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 230, 7,
                                7)), // Border color when the TextFormField is focused
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      labelStyle: TextStyle(
                          color: Color.fromARGB(255, 149, 160,
                              150)), // Changes the color of the label text
                      fillColor: Color.fromARGB(255, 250, 250,
                          250), // Changes the fill color of the text field
                      filled:
                          true, // Don't forget to set this to true to activate the fillColor
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(
                                255, 207, 61, 8)), // Normal border color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 212, 46,
                                13)), // Normal border color when the TextFormField is enabled but not focused
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 208, 58,
                                7)), // Border color when the TextFormField is focused
                      ),
                    ),
                    obscureText: true,
                  ),
                ),

                ElevatedButton(
                  child: Text('Giriş Yap'),
                  onPressed: () async {
                    try {
                      // Replace these with the actual user input values

                      String email = emailController.text;
                      String password = passwordController.text;

                      // Firebase Auth sign in
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
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
                ),

                TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color.fromARGB(
                        255, 229, 226, 226), // This is the text color
                  ),
                  child: Text('Hesabınız Yok mu? Üye Ol'),
                  onPressed: () {
                    // Navigate to registration page
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
