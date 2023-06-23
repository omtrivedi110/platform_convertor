import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platform_convertor/controller/ad_call_list.dart';
import 'package:platform_convertor/controller/date_controller.dart';
import 'package:platform_convertor/controller/device_controller.dart';
import 'package:platform_convertor/controller/image_controller.dart';
import 'package:platform_convertor/controller/pagecontoller.dart';
import 'package:platform_convertor/controller/theme_controller.dart';
import 'package:platform_convertor/views/screens/cupertionhomepage.dart';
import 'package:platform_convertor/views/screens/homepage.dart';
import 'package:provider/provider.dart';
import 'utils/routes_utils.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
        builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => Date_controller(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Call_list(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Theme_Controller(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Page_controller(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Time_controller(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Device_controller(),
                ),
                ChangeNotifierProvider(
                  create: (context) => Image_picker(),
                ),
              ],
              child: const MyApp(),
            ),
        enabled: !kReleaseMode),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return (Provider.of<Device_controller>(context).android)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              brightness: Provider.of<Theme_Controller>(context).isdark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            routes: {
              MyRoutes.home: (context) => HomePage(),
            },
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            theme: CupertinoThemeData(
              brightness: Provider.of<Theme_Controller>(context).isdark
                  ? Brightness.dark
                  : Brightness.light,
            ),
            routes: {
              MyRoutes.home: (context) => Cupertino_Home_Page(),
            },
          );
  }
}
