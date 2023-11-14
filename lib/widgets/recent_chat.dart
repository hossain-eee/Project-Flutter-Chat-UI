import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/model/message_model.dart';
class RecentChat extends StatelessWidget {
  const RecentChat({super.key});

  @override
  Widget build(BuildContext context) {
    return   Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    return Text(chats[index].sender.name);
                  }),
            ),
          );
  }
}