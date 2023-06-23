import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/controller/device_controller.dart';
import 'package:platform_convertor/views/screens/chat_page_cupertino.dart';
import 'package:platform_convertor/views/screens/contact_page_cupertino.dart';
import 'package:platform_convertor/views/screens/cupertinoaddcontact.dart';
import 'package:platform_convertor/views/screens/setting_cupertino.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable, camel_case_types
class Cupertino_Home_Page extends StatelessWidget {
  Cupertino_Home_Page({super.key});

  DateTime d = DateTime.now();

  List mypage = [
    Cupertino_Add_Con(),
    const ChatPage(),
    const Call_Page(),
    Setting_Cupertino(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.add), label: "add"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2), label: "chat"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: "call"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings), label: "setting"),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) => CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text("Platform Converter"),
                trailing: Switch.adaptive(
                  value: Provider.of<Device_controller>(context, listen: false)
                      .android,
                  onChanged: (bool value) {
                    Provider.of<Device_controller>(context, listen: false)
                        .changeplatform();
                  },
                ),
              ),
              child: mypage[index],
            ),
          );
        });
  }
}
