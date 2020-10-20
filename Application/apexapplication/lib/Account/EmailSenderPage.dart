import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppModel.dart';

class EmailSenderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppModel>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _requestTextBox(context),
              _UserEmailBox(context),
              _emailTextBox(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.info),
                      onPressed: () {
                        _showTextDialog(context);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'UserPage',
        icon: Icon(Icons.send),
        label: Text('送信'),
        onPressed: () {
          try {
            model.emailSend();
            _showTextDialogEmailSend(context);
          } catch (e) {
            _showDialog(context, e.toString());
          }
        },
      ),
    );
  }
}

Widget _requestTextBox(BuildContext context) {
  final model = Provider.of<AppModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.title = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Request title',
      ),
    ),
  );
}

Widget _UserEmailBox(
  BuildContext context,
) {
  final model = Provider.of<AppModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextFormField(
      onChanged: (value) {
        model.Email = value;
      },
      initialValue: model.menbar.Email,
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
      ),
    ),
  );
}

Widget _emailTextBox(BuildContext context) {
  final model = Provider.of<AppModel>(context);
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      onChanged: (value) {
        model.mailBody = value;
      },
      maxLengthEnforced: true,
      enableInteractiveSelection: true,
      maxLines: 10,
      decoration:
          InputDecoration(labelText: 'Body', border: OutlineInputBorder()),
    ),
  );
}

_showTextDialog(context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
            width: 300.0,
            height: 200.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'お問い合わせ',
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'アプリに対するお問い合わせや、',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '追加希望の機能やデータなどの、',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'ご意見お待ちしております！',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

_showTextDialogEmailSend(context) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
            width: 300.0,
            height: 200.0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'ご意見ありがとうございます！',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ユーザー様のフィードバックは全て、',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '確認させていただいております！',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        'これからもアプリの機能改善に、',
                        style: TextStyle(fontSize: 17),
                      ),
                      Text(
                        '尽力いたします。m(_ _)m',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          FlatButton(
            child: Text('正常に送信されました!'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
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
            child: Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
