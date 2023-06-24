import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platform_convertor/controller/ad_call_list.dart';
import 'package:platform_convertor/controller/theme_controller.dart';
import 'package:provider/provider.dart';
import '../../controller/date_controller.dart';
import '../../modals/call_modal.dart';

// ignore: must_be_immutable, camel_case_types
class Cupertino_Add_Con extends StatelessWidget {
  Cupertino_Add_Con({super.key});

  File? image;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String name = "";
  String number = "";
  String chat = "";

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.all(
          17,
        ),
        child: Center(
          child: GestureDetector(
            onTap: () async {
              ImagePicker picker = ImagePicker();
              XFile? img = await picker.pickImage(
                source: ImageSource.camera,
              );
              image = File(img!.path);
            },
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 175,
                    width: 175,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey2,
                      borderRadius: BorderRadius.circular(
                        300,
                      ),
                      // image: DecorationImage(image: ,
                      // ),
                    ),
                    child: const Text(
                      "Add Photo",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Text(
                          "👤",
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: CupertinoTextFormFieldRow(
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
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            border: Border.all(
                              color: (Provider.of<Theme_Controller>(context)
                                      .isdark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Icon(
                          CupertinoIcons.phone,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: CupertinoTextFormFieldRow(
                          maxLength: 10,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your Number";
                            } else if (val.length < 10) {
                              return "Enter valid Number";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            number = val!;
                          },
                          keyboardType: TextInputType.number,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (Provider.of<Theme_Controller>(context)
                                      .isdark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        child: Icon(
                          CupertinoIcons.chat_bubble_2,
                        ),
                      ),
                      Expanded(
                        flex: 16,
                        child: CupertinoTextFormFieldRow(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Your chat";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            chat = val!;
                          },
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (Provider.of<Theme_Controller>(context)
                                      .isdark)
                                  ? CupertinoColors.white
                                  : CupertinoColors.black,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            maximumYear: 2024,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime value) {
                              Provider.of<Date_controller>(context,
                                      listen: false)
                                  .changedate(date: value);
                            },
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          CupertinoIcons.calendar,
                        ),
                        const Text(
                          "Pick Date",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                            "${Provider.of<Date_controller>(context).date.day}/${Provider.of<Date_controller>(context).date.month}/${Provider.of<Date_controller>(context).date.year}")
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) => SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            maximumYear: 2024,
                            mode: CupertinoDatePickerMode.time,
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime value) {
                              Provider.of<Date_controller>(context,
                                      listen: false)
                                  .changedate(date: value);
                            },
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(CupertinoIcons.clock),
                        const Text(
                          "Pick Time",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${Provider.of<Date_controller>(context).date.hour} : ${Provider.of<Date_controller>(context).date.minute}",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  CupertinoButton.filled(
                      child: const Text("Save"),
                      onPressed: () {
                        formkey.currentState!.validate();
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          Provider.of<Call_list>(context, listen: false)
                              .callist
                              .add(Call(
                                  name: name, contact: number, chat: chat));
                          Provider.of<Call_list>(context)
                              .addsflist(name: name, num: number);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
