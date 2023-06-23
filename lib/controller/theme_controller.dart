import 'package:flutter/cupertino.dart';

class Theme_Controller extends ChangeNotifier {
  bool isdark = false;
  void changeTheme() {
    isdark = !isdark;
    debugPrint("$isdark");
    notifyListeners();
  }
}
