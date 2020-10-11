import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = false;
        switch (sizingInformation.deviceScreenType) {
          case DeviceScreenType.desktop:
            break;
          case DeviceScreenType.tablet:
          case DeviceScreenType.mobile:
          case DeviceScreenType.watch:
            isMobile = true;
            break;
        }
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  Container(
                    child: Row(
                      children: [
                        SizedBox(width: 50),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'APEXランクマッチでより多くのポイントをあなたに',
                              style: TextStyle(
                                  fontSize: 35, fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
//SizedBox(width: 70),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('知ったその瞬間から、役立つ知識の提供',
                                style: TextStyle(fontSize: 25)),
                            SizedBox(height: 20),
                            Text('APEXにおける知識はランクマッチに置いて、ポイント増減に大きく貢献できるスキルです。'),
                            Text('ですが、全ての仕様・知識を網羅するのはとても難しく、'),
                            Text('情報は各所に散らばっている為、探し出すのも一苦労です。'),
                            Text('そこで本サイトをそれらの知見の累積・共有を目的として運営しています。'),
                          ],
                        ),
//SizedBox(width: 50),
                        Container(
                            width: 400,
                            height: 400,
                            child: Image.asset(
                              'images/RankMatchIcon.jpg',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 190),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('HidePositionの提供',
                                style: TextStyle(fontSize: 25)),
                            SizedBox(height: 10),
                            Text('ランクマッチでは人数不利を負ったまま試合を継続することが頻発します。'),
                            Text('ポイントの増加を目的として「Hideをする」行為は立派な戦略です。'),
                            Text('ここでは、それらの情報を累積・共有します'),
                          ],
                        ),
                        Container(
                            width: 400,
                            height: 400,
                            child: Image.asset(
                              'images/RankMatchIcon.jpg',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 400,
                            height: 400,
                            child: Image.asset(
                              'images/RankMatchIcon.jpg',
                              fit: BoxFit.cover,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('WeaponRecoilの閲覧',
                                style: TextStyle(fontSize: 25)),
                            SizedBox(height: 10),
                            Text('リコイルの制御はFPSに置いて避けられません。'),
                            Text('詳細なリコイルの把握とリコイルを目視しながらの'),
                            Text('快適なトレーニングのための情報を提供します。'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('APEXTips', style: TextStyle(fontSize: 25)),
                            Text('細かな使用や一見してわからない、だが試合に大きい影響を与える知識があります。'),
                            Text('これらを閲覧することで、特に新規の方のお役に立てると考えています。'),
                          ],
                        ),
                        Container(
                            width: 400,
                            height: 400,
                            child: Image.asset(
                              'images/RankMatchIcon.jpg',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 300,
                    width: 1220,
                    color: Colors.black87,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Account登録',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Text('・プレイリストの作成',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Text('　利用機会が多い情報でプレイリストを作成し、利便性を向上します。',
                                style: TextStyle(color: Colors.white)),
                            Text('・お問い合わせ',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            Text(' 管理者へのご相談はこちらから。登録時のEmai/Gmailへご返信いたします。',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('終わりに', style: TextStyle(fontSize: 25)),
                            Text(
                                '・動作確認はPS4にて行っています。他プラットフォームでも使用可能な情報とは思いますがご容赦下さい。'),
                            Text(
                                '・データの大幅更新はシーズン変更毎に行います(スプリット毎ではありません)。データの追加は随時行って行きますが'),
                            Text('　大幅な見直しはマップ変更や使用変更が多いシーズン変更毎であることをご了承ください。'),
                            Text(
                                '・管理者自身もまだ知らない知識があることを自覚しています。「あれ？これデータに載ってないな、、、」'),
                            Text('　と思ったら是非Account登録後、知識提供をお願いいたします。'),
                            SizedBox(height: 20),
                            Text(
                                '・堅苦しく記述してきましたが、「APEXで勝てたら楽しいだろうなぁ」の気持ちから、その手助けをしたい気持ちで運営しています。'),
                            Text('　どうぞお気軽にご利用ください。'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 100),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('謝辞', style: TextStyle(fontSize: 25)),
                            Text(
                                '・公開しているデータの全ては管理者と友人の知識、またはYoutubeにて公開されているデータを元に作成しています'),
                            Text(
                                '　撮影は全て管理者本人または友人が行っているため、データの大元等を公開や記載することはありませんが、'),
                            Text(
                                '　Youtubeでのデータ公開無しには本サイトは成り立ちません。活動を行っているAPEXYoutuberの皆様に感謝を申し上げます。'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //todo 自身の学習や外部発信をまとめたサイトリンクを貼る
                  SizedBox(height: 200),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
