import 'package:flutter/material.dart';

class PetInformationForm extends StatefulWidget {
  @override
  _PetInformationFormState createState() => _PetInformationFormState();
}

class _PetInformationFormState extends State<PetInformationForm> {
  final _formKey = GlobalKey<FormState>();
  String petType = 'Kedi';
  String petAge = '0-3 ay';
  String petGender = 'Dişi';
  bool isSterilized = false;
  // ... other state variables ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evcil Hayvan İlan Formu'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Temel Bilgiler',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  value: petType,
                  onChanged: (newValue) => setState(() => petType = newValue!),
                  items:
                      ['Kedi', 'Köpek'].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                DropdownButtonFormField<String>(
                  value: petAge,
                  onChanged: (newValue) => setState(() => petAge = newValue!),
                  items: [
                    '0-3 ay',
                    '3-6 ay',
                    '6-12 ay',
                    '1 yıl',
                    '2 yıl',
                    '3 yıl',
                    '25 yıl'
                  ].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                // ... more fields ...
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process form data
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
