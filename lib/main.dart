import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proje1/onboardingScreen.dart';
import 'firebase_options.dart';
import 'HomeScreen.dart';
import 'loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MatchMeow',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      //home: HomeScreen(),
      home: const OnboardingScreen(),
    );
  }
}
