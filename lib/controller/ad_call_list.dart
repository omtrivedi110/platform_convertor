import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modals/call_modal.dart';

class Call_list extends ChangeNotifier {
  SharedPreferences prefs;
  Call_list({required this.prefs});
  List<Call> callist = [];
  List<String> namelist = [];
  List<String> numlist = [];
  String sfname = "sfname";
  String sfnum = "sfnum";

  List<String> get getnamelist {
    namelist = prefs.getStringList(sfname) ?? [];
    return namelist;
  }

  List<String> get getnumlist {
    numlist = prefs.getStringList(sfnum) ?? [];
    return numlist;
  }

  void addsflist({required String name, required String num}) {
    namelist = prefs.getStringList(sfname) ?? [];
    numlist = prefs.getStringList(sfnum) ?? [];

    namelist.add(name);
    numlist.add(num);

    prefs.setStringList(sfname, namelist);
    prefs.setStringList(sfnum, numlist);
  }
}
