import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SendPassWordResetEmailModel extends ChangeNotifier {
  String userEmail;
  Future sendPasswordResetEmail() async {
    try {
      if (userEmail == null) {
        throw ('メールを入力してください。');
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userEmail);
    } catch (e) {
      throw ('メールの送信に失敗しました。');
    }
  }
}
