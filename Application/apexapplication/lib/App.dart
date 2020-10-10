import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppModel.dart';
import 'Application/ApplicationPage.dart';
import 'Loading/LoadingPage.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APEX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider<AppModel>(
        create: (_) => AppModel(),
        child: Consumer<AppModel>(builder: (context, model, child) {
          return Scaffold(
              //ios/androidでキーボード呼び出し時に、画面を固定する宣言。初期ではtrueになっている。
              resizeToAvoidBottomPadding: false,
              body: model.isLoading
                  ? LoadingPage()
                  : ApplicationPage(model.loginState));
        }),
      ),
    );
  }
}
