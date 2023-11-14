import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});
  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
