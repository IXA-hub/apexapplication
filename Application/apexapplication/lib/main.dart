import 'package:flutter/material.dart';

import 'App.dart';

void main() {
  // main内で非同期処理を呼び出す場合runApp前に初期化が必要
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
