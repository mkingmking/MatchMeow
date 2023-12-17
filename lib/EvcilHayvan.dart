//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class EvcilHayvan {
  String _imageUrl;

  String get imageUrl => _imageUrl;

  set imageUrl(String value) => _imageUrl = value;

  String _name;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String _breed;

  String get breed => _breed;

  set breed(String value) {
    _breed = value;
  }

  int _age;

  int get age => _age;

  set age(int value) {
    _age = value;
  }

  List<String> _characteristics;

  List<String> get characteristics => _characteristics;

  set characteristics(List<String> value) {
    _characteristics = value;
  }

  String _color;

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  String _sex;

  String get sex => _sex;

  set sex(String value) {
    _sex = value;
  }

  String _type;

  String get type => _type;

  set type(String value) {
    _type = value;
  }

  bool _castrated;

  bool get castrated => _castrated;

  set castrated(bool value) {
    _castrated = value;
  }

  String _specialNeed;

  String get specialNeed => _specialNeed;

  set specialNeed(String value) {
    _specialNeed = value;
  }

  EvcilHayvan({
    required String name,
    required String breed,
    required int age,
    required List<String> characteristics,
    required String color,
    required String sex,
    required String type,
    required bool castrated,
    required String specialNeed,
    String imageUrl = '',
  })  : _name = name,
        _breed = breed,
        _age = age,
        _characteristics = characteristics,
        _color = color,
        _sex = sex,
        _type = type,
        _castrated = castrated,
        _specialNeed = specialNeed,
        _imageUrl = imageUrl;

  factory EvcilHayvan.fromJson(Map<String, dynamic> json) {
    return EvcilHayvan(
      name: json['name'] ?? '', // default to empty string if null
      breed: json['breed'] ?? '', // default to empty string if null
      age: json['age'] ?? 0, // default to 0 if null
      characteristics: List<String>.from(
          json['characteristics'] ?? []), // default to empty list if null
      color: json['color'] ?? '', // default to empty string if null
      sex: json['sex'] ?? '', // default to empty string if null
      type: json['type'] ?? '', // default to empty string if null
      castrated: json['castrated'] ?? false, // default to false if null
      specialNeed: json['specialNeed'] ?? '', // default to empty string if null
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  // Nesneyi JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'breed': breed,
      'age': age,
      'characteristics': characteristics,
      'color': color,
      'sex': sex,
      'type': type,
      'castrated': castrated,
      'specialNeed': specialNeed,
      'imageUrl': _imageUrl,
    };
  }
}
