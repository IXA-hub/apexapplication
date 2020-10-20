import 'package:cloud_firestore/cloud_firestore.dart';

class Menbar {
  String id;
  String nickname;
  String Email;

  Menbar.doc(DocumentSnapshot doc) {
    this.id = doc.id;
    this.nickname = doc.data()['nickname'];
    this.Email = doc.data()['Email'];
  }
}
