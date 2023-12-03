import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'EvcilHayvan.dart';

class AddPetPage extends StatefulWidget {
  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  // TextEditingController for text fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  // ... Add more controllers for other pet information

  // Function to add the pet to the database
  void _addPetToDatabase() {
    // Create an EvcilHayvan object
    EvcilHayvan newPet = EvcilHayvan(
      name: _nameController.text,
      type: _speciesController.text,
      age: int.tryParse(_ageController.text) ?? 0,
      characteristics: [], // TODO: bunlar icin de buton ekle
      color: "SampleColor", // TODO:
      sex: "SampleGender", // TODO:
      breed: "SampleBreed", // TODO:
      castrated: false, // TODO:
      specialNeed: "SampleSpecialCare", // TODO:
    );

    // Write the pet to the database
    DatabaseReference petRef =
        FirebaseDatabase.instance.reference().child('evcilHayvanlar').push();
    petRef.set(newPet.toJson());

    // Clear text field values after adding the pet
    _nameController.clear();
    _speciesController.clear();
    _ageController.clear();
    // ... Clear other text controllers

    //TODO eklenen butonlari kapat
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Pet Name'),
            ),
            TextField(
              controller: _speciesController,
              decoration: InputDecoration(labelText: 'Species'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            // ... Add more text fields for other pet information

            SizedBox(height: 16.0),

            ElevatedButton(
              onPressed: _addPetToDatabase,
              child: Text('Add Pet'),
            ),
          ],
        ),
      ),
    );
  }
}
