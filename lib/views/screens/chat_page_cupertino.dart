import 'package:flutter/cupertino.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text("No Chats , Yet"),
      ),
    );
  }
}
