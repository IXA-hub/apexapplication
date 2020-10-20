import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../App.dart';
import 'SignUpModel.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: (Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _emailSignUpBox(context),
                  SizedBox(height: 50),
                  _emailSignUpButtom(context),
                  SizedBox(height: 50),
                ],
              ),
            );
          },
        ),
      )),
    );
  }

  Widget _emailSignUpBox(BuildContext context) {
    final model = Provider.of<SignUpModel>(context);
    return Center(
      child: Container(
        width: 350,
        height: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, 15.0),
              blurRadius: 10.0,
            ),
            BoxShadow(
              color: Colors.blueGrey,
              offset: Offset(0.0, -15.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: 'example@email'),
                onChanged: (text) {
                  model.email = text;
                },
              ),
              Text("Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: 'password'),
                onChanged: (text) {
                  model.password = text;
                },
                obscureText: true,
              ),
              Text("Name",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextField(
                decoration: InputDecoration(hintText: 'username'),
                onChanged: (text) {
                  model.username = text;
                },
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailSignUpButtom(BuildContext context) {
    final model = Provider.of<SignUpModel>(context);
    return InkWell(
      child: Container(
        width: 190,
        height: 75,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF17ead9), Color(0xFF6078ea)]),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF6078ea).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () async {
              try {
                await model.emaiSignUp();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => App()));
              } catch (e) {
                _showDialog(context, e.toString());
              }
            },
            child: Center(
                child: Text('新規登録',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ))),
          ),
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
}
