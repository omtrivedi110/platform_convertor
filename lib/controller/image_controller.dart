import 'dart:io';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class Image_picker extends ChangeNotifier {
  File? img;
  imagetacker({required File? img}) {
    this.img = img;
    notifyListeners();
  }
}
