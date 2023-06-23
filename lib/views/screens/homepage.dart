import 'dart:io';
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/controller/ad_call_list.dart';
import 'package:platform_convertor/controller/date_controller.dart';
import 'package:platform_convertor/controller/device_controller.dart';
import 'package:platform_convertor/controller/image_controller.dart';
import 'package:platform_convertor/controller/pagecontoller.dart';
import 'package:platform_convertor/controller/theme_controller.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  DateTime? d = DateTime.now();
  File? image;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TimeOfDay? d1 = TimeOfDay.fromDateTime(DateTime.now());
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  String name = "";
  String contact = "";
  String email = "";
  NotchBottomBarController controller = NotchBottomBarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        actions: [
          Switch.adaptive(
            value:
                Provider.of<Device_controller>(context, listen: false).android,
            onChanged: (bool value) {
              Provider.of<Device_controller>(context, listen: false)
                  .changeplatform();
            },
          ),
        ],
        title: const Text("Platform Convertor"),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller:
            Provider.of<Page_controller>(context, listen: false).controller,
        children: [
          //add
          Padding(
            padding: const EdgeInsets.all(18),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Consumer<Image_picker>(
                          builder: (_, pro, __) => CircleAvatar(
                            radius: 85,
                            foregroundImage:
                                (pro.img != null) ? FileImage(pro.img!) : null,
                            child: const Text("No Photos Yet !"),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () async {
                            ImagePicker picker = ImagePicker();
                            XFile? img = await picker.pickImage(
                                source: ImageSource.camera);
                            image = File(img!.path);
                            // ignore: use_build_context_synchronously
                            Provider.of<Image_picker>(context, listen: false)
                                .imagetacker(
                              img: File(img.path),
                            );
                          },
                          mini: true,
                          child: const Icon(Icons.camera),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          hintText: "Enter Your Name",
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Name";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          name = val!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Number",
                          hintText: "Enter Contact Number",
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Number";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          contact = val!;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Chat",
                          hintText: "Enter Your Chat",
                        ),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Your Chat";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (val) {
                          email = val!;
                        },
                        onFieldSubmitted: (val) {
                          formkey.currentState!.validate();
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        d1 = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        // ignore: use_build_context_synchronously
                        Provider.of<Time_controller>(context, listen: false)
                            .changetime(date1: d1!);
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.timer,
                          ),
                          const Text(
                            "Pick Time",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<Time_controller>(
                            builder: (_, pro, __) =>
                                Text("${pro.date1.hour} : ${pro.date1.minute}"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        d = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2047),
                        );
                        // ignore: use_build_context_synchronously
                        Provider.of<Date_controller>(context, listen: false)
                            .changedate(date: d!);
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.calendar_month),
                          const Text(
                            "Pick Date",
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Consumer<Date_controller>(
                            builder: (_, pro, __) => Text(
                                "${pro.date.day} / ${pro.date.month} / ${pro.date.year}"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        formkey.currentState!.validate();
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          Provider.of<Call_list>(context, listen: false)
                              .callist
                              .add(
                                Call(name: name, contact: contact, chat: email),
                              );
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //call
          (Provider.of<Call_list>(context).callist.isEmpty)
              ? const Center(child: Text("No Calls Yet !!"))
              : ListView.builder(
                  itemCount: Provider.of<Call_list>(context).callist.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(
                        "${Provider.of<Call_list>(context).callist[index].name}"),
                    subtitle: Text(
                        "${Provider.of<Call_list>(context).callist[index].contact}"),
                  ),
                ),

          //chat Page
          const Center(
            child: Text("No Chats Yet !!"),
          ),

          //settings
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "🌙   Dark Mode",
                        style: TextStyle(fontSize: 20),
                      ),
                      Switch(
                          value: Provider.of<Theme_Controller>(context).isdark,
                          onChanged: (val) {
                            Provider.of<Theme_Controller>(context,
                                    listen: false)
                                .changeTheme();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: controller,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(Icons.add),
            activeItem: Icon(Icons.add_ic_call_outlined),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.person),
            activeItem: Icon(Icons.person_2_outlined),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.chat),
            activeItem: Icon(Icons.chat_outlined),
          ),
          BottomBarItem(
            inActiveItem: Icon(Icons.settings),
            activeItem: Icon(Icons.settings),
          ),
        ],
        onTap: (int value) {
          Provider.of<Page_controller>(context, listen: false)
              .changePage(index: value);
        },
      ),
    );
  }
}
