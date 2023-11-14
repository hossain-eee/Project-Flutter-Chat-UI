import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/model/message_model.dart';

class RecentChat extends StatelessWidget {
  const RecentChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: ClipRRect(
          /* ClipRRect in Flutter is a widget that clips its child using a rounded rectangle. It's often used to create rounded corners for child widgets, such as images or containers, providing a visually appealing and customized appearance. */
          //ClipRRect use so that ListView item also scroll within the circular radius top left and right, unless its scroll within rectengular area, by that now it will scroll up and hide listView item in radius/curly form
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final Message chat = chats[index];
                return Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5, right: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: chat.unread ? const Color(0XFFFFEFEE) : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(chat.sender.imageUrl),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.sender.name,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.43,
                                child: Text(
                                  chat.text,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            chat.time,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          chat.unread
                              ? Container(
                                  width: 40,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(30)),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'New',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                )
                              : const Text(''),
                        ],
                      )
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
