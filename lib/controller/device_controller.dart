import 'dart:io';

import 'package:flutter/foundation.dart';

// ignore: camel_case_types
class Device_controller extends ChangeNotifier {
  bool android = Platform.isAndroid;

  void changeplatform() {
    android = !android;
    notifyListeners();
  }
}
