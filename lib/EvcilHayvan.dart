//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class EvcilHayvan {
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

  //late DatabaseReference ref = FirebaseDatabase.instance.ref();

  //DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

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
  })  : _name = name,
        _breed = breed,
        _age = age,
        _characteristics = characteristics,
        _color = color,
        _sex = sex,
        _type = type,
        _castrated = castrated,
        _specialNeed = specialNeed;

  // Fabrika metodu: JSON'dan Nesneye dönüştürme
  factory EvcilHayvan.fromJson(Map<String, dynamic> json) {
    return EvcilHayvan(
      name: json['name'],
      breed: json['breed'],
      age: json['age'],
      characteristics: List<String>.from(json['characteristics']),
      color: json['color'],
      sex: json['sex'],
      type: json['type'],
      castrated: json['castrated'],
      specialNeed: json['specialNeed'],
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
    };
  }
}
