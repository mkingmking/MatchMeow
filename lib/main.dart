import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'HomeScreen.dart';
import 'User.dart';
import 'UserAdress.dart';

import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

  // Example user creation
  User user = User(
    name: 'John',
    surname: 'Doe',
    email: 'johndoe@example.com',
    sex: 'Male',
    age: 30,
    address: UserAddress(
      street: '123 Main St',
      city: 'Anytown',
      state: 'State',
      postalCode: '12345',
    ),
    userID: 'user123',
  );

  // Example of adding a pet hash to the user's swipedRight list
  user.addPetToSwipedRight('petHash123');

  DatabaseReference userRef =
      FirebaseDatabase.instance.ref().child('users').child(user.userID);
  userRef.set(user.toJson());

  // Printing to verify the addition
  print(user.swipedRight);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MatchMeow',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: HomeScreen(),
    );
  }
}
