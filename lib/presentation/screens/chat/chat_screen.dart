import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://scontent.fcor10-3.fna.fbcdn.net/v/t39.30808-6/428071653_3993187767674031_8699217079775955378_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=ajt0FQ6rw6UQ7kNvgEeKZXL&_nc_ht=scontent.fcor10-3.fna&oh=00_AYAZd7SXKwnTIAdFhwg_DTvaI4kUTxZpmps53C0eghjb_Q&oe=6666C5D9',
            ),
          ),
        ),
        title: const Text('Romi <3'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 5,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const MyMessageBubble()
                    : const HerMessageBubble();
              },
            ),
          ),
          const MessageFieldBox()
        ],
      ),
    );
  }
}
