import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
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
              'https://scontent.fcor10-4.fna.fbcdn.net/v/t31.18172-8/1534944_723264691031327_187275409_o.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeF7jzVZdOtK1lIqecNpJL1FamBGpfwBoa1qYEal_AGhrQ-OjoDoZCH6S2w9SwLdu8LNr5lzmeJiOQt0hbDeHSu8&_nc_ohc=WA8Pk-FlKicQ7kNvgHjPG6g&_nc_ht=scontent.fcor10-4.fna&oh=00_AYALZGW0x8luPak_1dFNj6ZbKN8wE3Xi1GD0ar4joELX9A&oe=66917F78',
            ),
          ),
        ),
        title: const Text('Javier'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

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
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final Message message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message)
                    : MyMessageBubble(message: message);
              },
            ),
          ),
          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          )
        ],
      ),
    );
  }
}
