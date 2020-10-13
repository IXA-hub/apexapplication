import 'package:apexapplication/ApexHideDataService/ApexHideDataServicePage.dart';
import 'package:apexapplication/ApexTipsService/ApexTipsServicePage.dart';
import 'package:apexapplication/Landing/LandingPage.dart';
import 'package:apexapplication/Loading/LoadingPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppModel.dart';

class ApplicationPage extends StatelessWidget {
  final bool isLogin;
  ApplicationPage(this.isLogin);

  final List<Widget> _appBarTabIcon = [
    Icon(Icons.apps, color: Colors.white),
    Icon(Icons.person_outline, color: Colors.white),
    Text(
      'HidePosition',
      style: TextStyle(color: Colors.white),
    ),
    Text(
      'ApexTips',
      style: TextStyle(color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AppModel>(context);
    return ChangeNotifierProvider.value(
      value: model,
      child: Consumer<AppModel>(
        builder: (context, model, child) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                toolbarHeight: 50.0,
                backgroundColor: Colors.black87,
                bottom: TabBar(
                  indicatorColor: Colors.black87,
                  unselectedLabelColor: Colors.black87,
                  onTap: (index) {
                    model.changePage(index);
                  },
                  tabs: [
                    Tab(
                      child: _appBarTabIcon[0],
                    ),
                    Tab(
                      child: _appBarTabIcon[1],
                    ),
                    Tab(
                      child: _appBarTabIcon[2],
                    ),
                    Tab(
                      child: _appBarTabIcon[3],
                    ),
                  ],
                ),
              ),
              body: _ServicepPage(context, isLogin),
            ),
          );
        },
      ),
    );
  }
}

Widget _ServicepPage(BuildContext context, bool isLogin) {
  final model = Provider.of<AppModel>(context);
  return Stack(
    children: [
      _tabPage(model.page, 0, LandingPage()),
      _tabPage(model.page, 1, LoadingPage()),
      _tabPage(model.page, 2, ApexHideDataServicePage()),
      _tabPage(model.page, 3, ApexTipsServicePage()),
    ],
  );
}

Widget _tabPage(int currentIndex, int tabIndex, StatelessWidget page) {
  return Visibility(
    visible: currentIndex == tabIndex,
    maintainState: true,
    child: page,
  );
}
