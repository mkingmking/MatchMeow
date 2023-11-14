import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'EvcilHayvan.dart';

class PetListPage extends StatefulWidget {
  @override
  _PetListPageState createState() => _PetListPageState();
}

class _PetListPageState extends State<PetListPage> {
  final DatabaseReference _databaseReference =
      FirebaseDatabase.instance.ref().child('evcilHayvanlar');
  List<EvcilHayvan> petList = [];

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
          List<EvcilHayvan> newList = [];
          map.forEach((key, value) {
            newList.add(EvcilHayvan.fromJson(value));
          });

          // Update the UI with the new list of pets
          setState(() {
            petList = newList;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet List'),
      ),
      body: ListView.builder(
        itemCount: petList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(petList[index].ad),
            subtitle: Text(petList[index].tur),
            // Add more details based on your UI requirements
          );
        },
      ),
    );
  }
}
