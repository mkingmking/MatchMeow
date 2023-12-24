import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'EvcilHayvan.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddPetPage extends StatefulWidget {
  final EvcilHayvan? pet;

  AddPetPage({Key? key, this.pet}) : super(key: key);

  @override
  _AddPetPageState createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _specialNeedController = TextEditingController();

  String _sex = 'Male';
  bool _castrated = false;
  List<String> _characteristics = [];
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

  void _addPetToDatabase() async {
    String imageUrl = '';
    if (_petImage != null) {
      imageUrl = await _uploadPetImage(_petImage!);
    }

    EvcilHayvan newPet = EvcilHayvan(
      name: _nameController.text,
      type: _speciesController.text,
      age: int.tryParse(_ageController.text) ?? 0,
      characteristics: _characteristics,
      color: _colorController.text,
      sex: _sex,
      breed: _breedController.text,
      castrated: _castrated,
      specialNeed: _specialNeedController.text,
      imageUrl: imageUrl,
    );

    DatabaseReference petRef =
        FirebaseDatabase.instance.reference().child('evcilHayvanlar').push();
    petRef.set(newPet.toJson());

    _nameController.clear();
    _speciesController.clear();
    _ageController.clear();
    _colorController.clear();
    _breedController.clear();
    _specialNeedController.clear();
    setState(() {
      _characteristics.clear();
    });
  }

  Widget _buildCharacteristicsChips() {
    List<String> options = ['Friendly', 'Active', 'Shy', 'Playful', 'Quiet'];

    return Wrap(
      spacing: 8.0,
      children: List<Widget>.generate(
        options.length,
        (int index) {
          return ChoiceChip(
            label: Text(options[index]),
            selected: _characteristics.contains(options[index]),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  _characteristics.add(options[index]);
                } else {
                  _characteristics.removeWhere((String name) {
                    return name == options[index];
                  });
                }
              });
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a Pet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              TextField(
                controller: _colorController,
                decoration: InputDecoration(labelText: 'Color'),
              ),
              TextField(
                controller: _breedController,
                decoration: InputDecoration(labelText: 'Breed'),
              ),
              DropdownButton<String>(
                value: _sex,
                onChanged: (String? newValue) {
                  setState(() {
                    _sex = newValue!;
                  });
                },
                items: <String>['Male', 'Female']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SwitchListTile(
                title: const Text('Castrated'),
                value: _castrated,
                onChanged: (bool value) {
                  setState(() {
                    _castrated = value;
                  });
                },
              ),
              TextField(
                controller: _specialNeedController,
                decoration: InputDecoration(labelText: 'Special Care Needs'),
              ),
              _buildCharacteristicsChips(),
              SizedBox(height: 16.0),
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
      ),
    );
  }
}
