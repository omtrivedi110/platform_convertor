import 'package:flutter/material.dart';

// ignore: camel_case_types
class Date_controller extends ChangeNotifier {
  DateTime date = DateTime.now();
  void changedate({required DateTime date}) {
    this.date = date;
    notifyListeners();
  }
}

class Time_controller extends ChangeNotifier {
  TimeOfDay date1 = TimeOfDay.fromDateTime(DateTime.now());

  void changetime({required TimeOfDay date1}) {
    this.date1 = date1;
    notifyListeners();
  }
}
