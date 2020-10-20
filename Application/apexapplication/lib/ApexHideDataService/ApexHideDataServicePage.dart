import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import 'ApexHideDataModel.dart';

class ApexHideDataServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return ChangeNotifierProvider<ApexHideDataServiceModel>(
      create: (_) => ApexHideDataServiceModel(), //..fetchApexData(),
      // ignore: missing_return
      child:
          Consumer<ApexHideDataServiceModel>(builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white70,
                    expandedHeight: 100.0,
                    actions: [
                      _searchBar(context, searchController),
                    ],
                    flexibleSpace:
                        FlexibleSpaceBar(title: Text('ApexHideDataList')),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 4.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Visibility(
                          visible:
                              true, //model.ApexDatas[index].sortState, //todo ここに表示非表示の条件を記入
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 5.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.teal,
                                    offset: Offset(0.0, -0.0),
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text('testmessageaa'),
                                  IconButton(
                                      icon: Icon(Icons.movie),
                                      onPressed: () async {
                                        await _showGifMovie(context,
                                            'https://firebasestorage.googleapis.com/v0/b/apexpositionapp.appspot.com/o/kingsCanyon%2Fpathfinder%2Frain1_animated_256.gif?alt=media&token=094a99cf-db86-4d90-9723-2764322c4324');
                                      })
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      //childCount: model.apexDatas.length,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _toggleSwitch(context, 'パスファインダー', 0),
                      _toggleSwitch(context, 'KingsCanyon', 1),
                      _toggleSwitch(context, 'WorldsEdge', 2),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget _searchBar(
    BuildContext context, TextEditingController searchController) {
  final model = Provider.of<ApexHideDataServiceModel>(context);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 500,
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: TextField(
        decoration: InputDecoration(
            focusColor: Colors.white,
            hintText: '空白検索でリセット',
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.black87,
                ),
                onPressed: () {
                  //model.sort(model.serchText);
                })),
        onChanged: (value) {
          model.searchText = value;
        },
      ),
    ),
  );
}

Widget _toggleSwitch(BuildContext context, String toggleText, int i) {
  final model = Provider.of<ApexHideDataServiceModel>(context);
  return Opacity(
    opacity: 0.9,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlutterSwitch(
        toggleColor: Colors.white,
        activeColor: Colors.tealAccent,
        inactiveTextColor: Colors.black45,
        activeTextColor: Colors.black45,
        activeText: toggleText,
        inactiveText: toggleText,
        value: model.toggleState[i],
        valueFontSize: 10.0,
        width: 130,
        borderRadius: 30.0,
        showOnOff: true,
        onToggle: (status) {
          model.changeToggleState(status, i);
        },
      ),
    ),
  );
}

_showGifMovie(context, url) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          Container(
              width: 300.0,
              height: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(75.0)),
              )),
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
