import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'User.dart'; // Make sure this import points to your User model

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('users');
  List<User> userList = [];

  @override
  void initState() {
    super.initState();

    // Set up a listener for real-time updates
    _databaseReference.onValue.listen((DatabaseEvent event) {
      // Handle data changes
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic>? map =
            event.snapshot.value as Map<dynamic, dynamic>?;

        if (map != null) {
          List<User> newList = [];

          map.forEach((key, value) {
            // Convert value to Map<String, dynamic> and add to list
            Map<String, dynamic> userData = Map<String, dynamic>.from(value);
            newList.add(User.fromJson(userData));
          });

          setState(() {
            userList = newList;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User List'),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: userList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userList[index].name),
                subtitle: Text(userList[index].email), // Use appropriate fields
                // Add more details based on your UI requirements
              );
            },
          ),
        ));
  }
}
