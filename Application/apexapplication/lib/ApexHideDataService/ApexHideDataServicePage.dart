import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        return //model.isLoading ? LoadingPage():
            GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //todo toggleSwitch
                    _searchBar(context, searchController),
                    //todo tips スイッチや検索を押したら表示のみを変える。データは最初に一括で取得
                  ],
                ),
                _ApexDataCardList(),
              ],
            ),
          ),
        );
      }),
    );
  }
}

Widget _searchBar(
    BuildContext context, TextEditingController searchController) {
  final model = Provider.of<ApexHideDataServiceModel>(context);
  return Container(
    width: 500,
    height: 60,
    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 5),
    child: TextField(
      decoration: InputDecoration(
          hintText: '空白検索でリセット',
          border: OutlineInputBorder(),
          labelText: '検索',
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //model.sort(model.serchText);
              })),
      onChanged: (value) {
        model.searchText = value;
      },
    ),
  );
}

class _ApexDataCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ApexHideDataServiceModel>(context);
    final List<Card> apexDataCard = model.apexDatas
        .map((apexData) => Card(
              child: Visibility(
                visible: true || true, // todo 検索もしくはソート機能の結果にて表示を変更
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 5.0,
                      ),
                      BoxShadow(
                        color: Colors.blueGrey,
                        offset: Offset(0.0, -0.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(apexData), //.title),
                    trailing: IconButton(
                      icon: Icon(Icons.movie),
                      onPressed: () async {
//                    String url = await model.getGif(apexData.gifDirectory1,
//                        apexData.gifDirectory2, apexData.gif);
//                    _showGifMovie(context, url);
                      },
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    return ListView(
      shrinkWrap: true,
      children: apexDataCard,
    );
  }
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
