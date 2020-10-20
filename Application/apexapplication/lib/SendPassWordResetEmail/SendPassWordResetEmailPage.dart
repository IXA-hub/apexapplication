import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SendPassWordResetEmailModel.dart';

class SendPasswordResetEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SendPassWordResetEmailModel>(
      create: (_) => SendPassWordResetEmailModel(),
      child: Scaffold(
        body: Consumer<SendPassWordResetEmailModel>(
          builder: (context, model, child) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 10.0,
                      ),
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, -10.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("パスワードの変更",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'example@email'),
                          onChanged: (text) {
                            model.userEmail = text;
                          },
                        ),
                        GestureDetector(
                          onTap: () async {
                            try {
                              await model.sendPasswordResetEmail();
                            } catch (e) {
                              _showDialog(context, e.toString());
                            }
                          },
                          child: Text(
                            '更新の為のメールを送信します',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text(title),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
