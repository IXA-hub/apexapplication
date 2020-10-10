import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80),
          Container(
            child: Row(
              children: [
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'APEXランクマッチで,',
                      style: TextStyle(fontSize: 35),
                    ),
                    Text(
                      'より多くのポイントをあなたに',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 100),
          Container(
            child: Row(
              children: [
                SizedBox(width: 70),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('知ったその瞬間から、役立つ知識の提供', style: TextStyle(fontSize: 25)),
                    Flexible(
                        child: Text(
                            'APEXにおける知識はランクマッチに置いて、ポイント増減に大きく貢献できるスキルです。')),
                    Text('ですが、新規/既存を問わず全ての仕様・知識を網羅するのはとても難しく、また情報は各所に'),
                    Text('散らばっている為、探し出すのも一苦労です。'),
                    Text('そこで本サイトをそれらの知見の累積・共有を目的として運営しています。'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
