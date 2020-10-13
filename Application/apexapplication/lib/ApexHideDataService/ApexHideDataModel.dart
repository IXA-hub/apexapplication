import 'package:flutter/cupertino.dart';

class ApexHideDataServiceModel extends ChangeNotifier {
  bool isLoading = true; //todo Firebaseからのデータ取得状況のState

  String searchText = '';

  var toggleState = [false, false, false];
  changeToggleState(status, i) {
    toggleState[i] = status;
    notifyListeners();
  }
}
