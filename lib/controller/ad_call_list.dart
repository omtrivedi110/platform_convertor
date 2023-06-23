import 'package:flutter/cupertino.dart';

class Call {
  String? name;
  String? contact;
  String? chat;
  Call({required this.name, required this.contact, required this.chat});
}

class Call_list extends ChangeNotifier {
  List<Call> callist = [];
}
