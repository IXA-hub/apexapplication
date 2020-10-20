import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Domain/Menbar.dart';

class AppModel extends ChangeNotifier {
  bool isLoading = true;
  bool loginState = false;

  //コンストラクタ
  AppModel() {
    _init();
  }

  Future _init() async {
    if (isLoading == false) {
      isLoading = true;
    }
    //firebase初期化
    await Firebase.initializeApp();

    if (await isLogin()) {
      isLoading = false;
      loginState = true;
      await getMenbarState();
    } else {
      isLoading = false;
      loginState = false;
    }
    isLoading = false;
    //loading表示のため待機
    await Future.delayed(Duration(seconds: 3));
    notifyListeners();
  }

  Future isLogin() async {
    if (await FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    return false;
  }

  String userID = '';
  Menbar menbar;
  String email;
  Future getMenbarState() async {
    userID = FirebaseAuth.instance.currentUser.uid;
    final doc =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    Menbar menbar = Menbar.doc(doc);
    this.menbar = menbar;
    this.email = menbar.Email;
    notifyListeners();
  }

  int page = 0;
  changePage(int page) {
    this.page = page;
    notifyListeners();
  }
}
