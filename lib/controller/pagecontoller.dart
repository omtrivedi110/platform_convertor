import 'package:flutter/material.dart';

// ignore: camel_case_types
class Page_controller extends ChangeNotifier {
  int index = 0;
  PageController controller = PageController();
  void changePage({required int index}) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
    this.index = index;
    notifyListeners();
  }
}
