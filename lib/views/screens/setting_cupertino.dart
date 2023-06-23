import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/controller/theme_controller.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types, must_be_immutable
class Setting_Cupertino extends StatelessWidget {
  Setting_Cupertino({super.key});

  File? image;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "🌙   Dark Mode",
                    style: TextStyle(fontSize: 20),
                  ),
                  Consumer<Theme_Controller>(builder: (context, pro, _) {
                    return CupertinoSwitch(
                        value: pro.isdark,
                        onChanged: (val) {
                          pro.changeTheme();
                        });
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
