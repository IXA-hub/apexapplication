import 'package:flutter/cupertino.dart';

class ApexHideDataServiceModel extends ChangeNotifier {
  bool isLoading = true;
  String searchText = '';

  List<String> apexDatas = ['A', 'B', 'C', 'D', 'E'];
}
