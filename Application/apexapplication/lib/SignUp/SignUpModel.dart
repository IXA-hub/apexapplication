import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpModel extends ChangeNotifier {
  String email;
  String password;
  String username;
  User user;

  Future emaiSignUp() async {
    String patternNumber = r"(\d+)";
    RegExp checkPasswordIsNumber = new RegExp(patternNumber);
    String patternString = r"([a-z])";
    RegExp checkPasswordIsString = new RegExp(patternString);

    if (email.isEmpty) {
      throw ('Emailを入力してください');
    }

    if (password.isEmpty) {
      throw ('パスワードを入力してください');
    }

    if (username.isEmpty) {
      throw ('名前を入力してください');
    }

    if (password.length <= 7) {
      throw ('パスワードは8文字以上で設定してください');
    } else if (checkPasswordIsNumber.hasMatch(password) == false) {
      throw ('パスワードに最低一つ数値を入力してください');
    } else if (checkPasswordIsString.hasMatch(password) == false) {
      throw ('パスワードは最低一つ文字を入力してください');
    }

    try {
      user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
    } catch (e) {
      _signUpErrorContext(e);
    }

    FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'uid': user.uid,
        'nickname': username,
        'Email': user.email,
        'createdAt': Timestamp.now(),
      },
    );
  }

  String _signUpErrorContext(e) {
    switch (e) {
      case 'email-already-in-use':
        return 'このメールアドレスは既に使用されています';
      case 'invalid-email':
        return '無効なメールアドレスです';
      case 'weak-password':
        return 'パスワードは6文字以上に設定してください';
      default:
        return '不明なエラーです';
    }
  }
}
