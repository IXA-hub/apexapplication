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

  String deleteCheckPassword;
  Future deleteUser() async {
    if (deleteCheckPassword == null) {
      throw ('パスワードを入力してください');
    }

    final firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser
        .reauthenticateWithCredential(EmailAuthProvider.credential(
      email: firebaseUser.email,
      password: deleteCheckPassword,
    ));
    isLoading = true;
    await firebaseUser.delete();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .delete();
    _init();
  }

  String newNickName;
  Future changeNickName() async {
    if (newNickName == null) {
      throw ('usernameを入力してください');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .update({'nickname': newNickName});
    newNickName = null;
    await getMenbarState();
  }

  String userEmail;
  Future sendPasswordResetEmail() async {
    final firebaseUser = FirebaseAuth.instance;
    userEmail = firebaseUser.currentUser.email;
    await firebaseUser.sendPasswordResetEmail(email: userEmail);
  }

  String title;
  String mailBody;
  String Email;
  Future emailSend() {
    if (title == null || title == '') {
      throw ('タイトルを入力してください');
    }
    if (mailBody == null || title == '') {
      throw ('メール内容が空です');
    }
    if (Email == null || Email == '') {
      throw ('メールアドレスを入力してください');
    }

    FirebaseFirestore.instance.collection('email').add({
      'title': title,
      'email': Email,
      'mailbody': mailBody,
      'createdAt': Timestamp.now(),
    });
  }

  int appPage = 0;
  changeAppPage(int page) {
    this.appPage = page;
    notifyListeners();
  }

  int menbarPage = 0;
  changeMenbarPage(int page) {
    this.menbarPage = page;
    notifyListeners();
  }

  bool deleteUserBoxState = true;
  String deleteCheck = '';
  deleteCheckChange(String x) {
    deleteCheck = x;
    notifyListeners();
  }

  deleteUserBoxStateChange(bool x) {
    deleteUserBoxState = x;
    notifyListeners();
  }

  bool deleteuserNextBotton = true;
  bool deleteuserRunButton = false;
  deleteuserNextBottonChange(bool x) {
    deleteuserNextBotton = x;
    notifyListeners();
  }

  deleteuserRunButtonChange(bool x) {
    deleteuserRunButton = x;
    notifyListeners();
  }

  bool reFleshPasswordBoxState = true;

  changeefleshpasswordBoxState(bool x) {
    reFleshPasswordBoxState = x;
    notifyListeners();
  }

  bool nicknameBoxState = true;
  changeNicknameBoxState(bool x) {
    nicknameBoxState = x;
    notifyListeners();
  }
}
