import 'package:flutter/cupertino.dart';
import 'package:platform_convertor/controller/ad_call_list.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Call_Page extends StatelessWidget {
  const Call_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: (Provider.of<Call_list>(context).callist.isEmpty)
            ? const Text("No Call Yet !!")
            : Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Consumer<Call_list>(
                    builder: (_, pro, __) => CupertinoListSection(
                      children: List.generate(
                        pro.callist.length,
                        (index) => CupertinoListTile(
                          title: Text(
                            "${pro.callist[index].name}",
                          ),
                          subtitle: Text(
                            "${pro.callist[index].contact}",
                          ),
                          leading: SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                            child: Text(
                              "${index + 1}",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
