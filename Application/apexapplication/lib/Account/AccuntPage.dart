import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppModel.dart';
import 'EmailSenderPage.dart';
import 'MenbarPage.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppModel>(context);
    return ChangeNotifierProvider.value(
        value: model,
        // ignore: missing_return
        child: Consumer<AppModel>(builder: (context, model, child) {
          if (model.menbar == null) {
            return Center(child: CircularProgressIndicator());
          }
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: AppBar(
                title: Text(model.menbar.nickname),
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  onTap: (index) {
                    model.changeMenbarPage(index);
                  },
                  tabs: [
                    Tab(
                      child: Icon(Icons.account_circle),
                    ),
                    Tab(
                      child: Icon(Icons.contact_mail),
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Visibility(
                    visible: model.menbarPage == 0,
                    child: MenbarPage(),
                  ),
                  Visibility(
                    visible: model.menbarPage == 1,
                    child: EmailSenderPage(),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
