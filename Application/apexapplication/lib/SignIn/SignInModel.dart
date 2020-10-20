import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignInModel extends ChangeNotifier {
  String email;
  String password;

  Future emailSignIn() async {
    if (email == null) {
      throw ('メールアドレスを入力してください');
    }
    if (password == null) {
      throw ('パスワードを入力してください');
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      throw _returnErrorContexts(e);
    }
  }

  String _returnErrorContexts(String e) {
    switch (e) {
      case 'invalid-email':
        return 'メールを正しい形式で入力してください';
      case 'user-disabled':
        return 'ユーザーが無効です';
      case 'user-not-found':
        return '入力したEmailでは登録されていません。';
      case 'wrong-password':
        return 'パスワードが間違っています';
      default:
        return '不明なエラーです';
    }
  }
}
