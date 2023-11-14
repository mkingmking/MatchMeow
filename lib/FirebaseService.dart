import 'package:firebase_database/firebase_database.dart';
import 'EvcilHayvan.dart';

class FirebaseService {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> addEvcilHayvan(EvcilHayvan evcilHayvan) async {
    try {
      // Firebase Realtime Database'ye evcil hayvanı ekleme
      await _database.child('evcilHayvanlar').push().set(evcilHayvan.toJson());

      print('Evcil hayvan başarıyla eklendi.');
    } catch (e) {
      print('Evcil hayvan eklenirken hata oluştu: $e');
    }
  }
}
