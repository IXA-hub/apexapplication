import 'package:apexapplication/SendPassWordResetEmail/SendPassWordResetEmailPage.dart';
import 'package:apexapplication/SignUp/SignUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../App.dart';
import 'SignInModel.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInModel>(
      create: (_) => SignInModel(),
      child: (Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: Consumer<SignInModel>(
          builder: (context, model, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _emailSignInBox(context),
                  SizedBox(height: 50),
                  _emailSignInButton(context),
                  SizedBox(height: 50),
                  _line(context),
                  SizedBox(height: 50),
                  _signUpPageButtom(context),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      )),
    );
  }

  Widget _emailSignInBox(BuildContext context) {
    final model = Provider.of<SignInModel>(context);
    return Center(
      child: Container(
        width: 350,
        height: 300,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SendPasswordResetEmailPage()),
                      );
                    },
                    child: Text(
                      'passwordを忘れた場合',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailSignInButton(BuildContext context) {
    final model = Provider.of<SignInModel>(context);
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
                await model.emailSignIn();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => App()),
                );
              } catch (e) {
                _showDialog(context, e.toString());
              }
            },
            child: Center(
                child: Text('ログイン',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ))),
          ),
        ),
      ),
    );
  }

  Widget _line(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: 300,
            height: 1.0,
            color: Colors.black12.withOpacity(.2),
          ),
        ),
      ],
    );
  }

  Widget _signUpPageButtom(BuildContext context) {
    return InkWell(
      child: Container(
        width: 220,
        height: 40,
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
            onTap: () {
              try {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage()));
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
