//import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_database/firebase_database.dart';

class EvcilHayvan {
  String ad;
  String tur;
  int yas;
  List<String> karakteristikler;
  String renk;
  String cinsiyet;
  String cinsi;
  bool kisirlastirilmis;
  String ozelBakimDurumu;

  //late DatabaseReference ref = FirebaseDatabase.instance.ref();

  //DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

  EvcilHayvan({
    required this.ad,
    required this.tur,
    required this.yas,
    required this.karakteristikler,
    required this.renk,
    required this.cinsiyet,
    required this.cinsi,
    required this.kisirlastirilmis,
    required this.ozelBakimDurumu,
  });

  // Fabrika metodu: JSON'dan Nesneye dönüştürme
  factory EvcilHayvan.fromJson(Map<String, dynamic> json) {
    return EvcilHayvan(
      ad: json['ad'],
      tur: json['tur'],
      yas: json['yas'],
      karakteristikler: List<String>.from(json['karakteristikler']),
      renk: json['renk'],
      cinsiyet: json['cinsiyet'],
      cinsi: json['cinsi'],
      kisirlastirilmis: json['kisirlastirilmis'],
      ozelBakimDurumu: json['ozelBakimDurumu'],
    );
  }

  // Nesneyi JSON'a dönüştürme
  Map<String, dynamic> toJson() {
    return {
      'ad': ad,
      'tur': tur,
      'yas': yas,
      'karakteristikler': karakteristikler,
      'renk': renk,
      'cinsiyet': cinsiyet,
      'cinsi': cinsi,
      'kisirlastirilmis': kisirlastirilmis,
      'ozelBakimDurumu': ozelBakimDurumu,
    };
  }
}
