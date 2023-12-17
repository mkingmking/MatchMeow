import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'EvcilHayvan.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

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

  File? _petImage;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _petImage = File(pickedFile.path);
      });
    }
  }

  Future<String> _uploadPetImage(File petImage) async {
    String fileName =
        'pets/${DateTime.now().millisecondsSinceEpoch}_${petImage.path.split('/').last}';
    UploadTask uploadTask =
        FirebaseStorage.instance.ref().child(fileName).putFile(petImage);

    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  // Function to add the pet to the database
  void _addPetToDatabase() async {
    String imageUrl = '';
    if (_petImage != null) {
      imageUrl = await _uploadPetImage(_petImage!);
    }
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
      imageUrl: imageUrl,
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

            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Pet Image'),
            ),

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
