import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ApexTipsServiceModel.dart';

class ApexTipsServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return ChangeNotifierProvider<ApexTipsServiceModel>(
      create: (_) => ApexTipsServiceModel(), //..fetchApexData(),
      // ignore: missing_return
      child: Consumer<ApexTipsServiceModel>(builder: (context, model, child) {
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
                        FlexibleSpaceBar(title: Text('ApexTipsList')),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 800.0,
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
                            padding: const EdgeInsets.all(10.0),
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text('TestTitle',
                                              style: TextStyle(fontSize: 24)),
                                          IconButton(
                                              icon: Icon(
                                                Icons.article_outlined,
                                              ),
                                              onPressed: null),
                                        ],
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20, left: 20),
                                          child: Container(
                                            width: 400,
                                            child: Text(
                                              'TestDodyMassage aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 4,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: Container(
                                            width: 100,
                                            height: 100,
                                            child: Image.asset(
                                              'images/RankMatchIcon.jpg',
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                    ],
                                  ),
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
            ],
          ),
        );
      }),
    );
  }
}

Widget _searchBar(
    BuildContext context, TextEditingController searchController) {
  final model = Provider.of<ApexTipsServiceModel>(context);
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
        onChanged: (value) {},
      ),
    ),
  );
}
