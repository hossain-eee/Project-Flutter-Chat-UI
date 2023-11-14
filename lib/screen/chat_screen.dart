import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/model/message_model.dart';
import 'package:flutter_chat_ui/model/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});
  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 80,
            )
          : const EdgeInsets.only(
              top: 8,
              bottom: 8,
              // right: 80,
            ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: isMe
            ? Theme.of(context).colorScheme.secondary
            : const Color(0XFFFFEFEE),
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
            : const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            message.text,
            style: const TextStyle(
              color: Colors.blueGrey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        //button for favorite icon
        IconButton(
          onPressed: () {},
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
        )
      ],
    );
  }

//method
  _buildMessageCompolser() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.photo,
                size: 25,
                color: Theme.of(context).primaryColor,
              )),
          const Expanded(
              child: TextField(
            textCapitalization:
                TextCapitalization.sentences, // first word of sentence
            decoration: InputDecoration.collapsed(
              //to disappear underlie form below textField, use InputDecoration.collapsed
              hintText: 'Send a message...',
            ),
          )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                size: 25,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.user.name,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView.builder(
                  reverse:
                      true, //chat screen should display data bottom to top, that means reverse
                  padding: const EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final Message message = messages[index];
                    final bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
          //
          _buildMessageCompolser(),
        ],
      ),
    );
  }
}
