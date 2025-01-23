import 'package:doerr/shared/presentation/theme/extra_colors.dart';
import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:doerr/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/widgets/constants/app_text.dart';
import '../../../domain/entity/message.dart';
import '../widgets/messages_search_delegate.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  // Sample messages list
  final List<MessageModel> _messages = [
    MessageModel(
      name: 'Bernard Awusi',
      lastMessage:
          'Please I am done delivering the itemsssssssssssssssssssssssssssss',
      time: '11:23 pm',
      unreadCount: 2,
      avatarUrl:
          'https://images.pexels.com/photos/1222271/pexels-photo-1222271.jpeg?cs=srgb&dl=pexels-justin-shaifer-501272-1222271.jpg&fm=jpg',
    ),
    MessageModel(
      name: 'John Doe',
      lastMessage: 'Can we meet tomorrow?',
      time: '10:45 am',
      unreadCount: 1,
      avatarUrl: 'https://example.com/john.jpg',
    ),
    MessageModel(
      name: 'Alice Smith',
      lastMessage: 'The project is completed',
      time: '9:15 pm',
      unreadCount: 0,
      avatarUrl: 'https://example.com/alice.jpg',
    ),
    MessageModel(
      name: 'Emma Johnson',
      lastMessage: 'Don\'t forget about the meeting at 2 PM',
      time: '8:30 am',
      unreadCount: 3,
      avatarUrl: 'https://example.com/emma.jpg',
    ),
    MessageModel(
      name: 'Michael Brown',
      lastMessage: 'Thanks for your help yesterday!',
      time: 'Yesterday',
      unreadCount: 0,
      avatarUrl: 'https://example.com/michael.jpg',
    ),
    MessageModel(
      name: 'Sophia Lee',
      lastMessage: 'Can you send me the report?',
      time: 'Yesterday',
      unreadCount: 1,
      avatarUrl: 'https://example.com/sophia.jpg',
    ),
    MessageModel(
      name: 'David Wilson',
      lastMessage: 'How\'s the new project going?',
      time: 'Monday',
      unreadCount: 0,
      avatarUrl: 'https://example.com/david.jpg',
    ),
    MessageModel(
      name: 'Olivia Garcia',
      lastMessage: 'Let\'s catch up over lunch next week',
      time: 'Monday',
      unreadCount: 0,
      avatarUrl: 'https://example.com/olivia.jpg',
    ),
    MessageModel(
      name: 'Ethan Taylor',
      lastMessage: 'I\'ve updated the design files',
      time: 'Sunday',
      unreadCount: 2,
      avatarUrl: 'https://example.com/ethan.jpg',
    ),
    MessageModel(
      name: 'Ava Martinez',
      lastMessage: 'Can you review my code changes?',
      time: 'Last week',
      unreadCount: 0,
      avatarUrl: 'https://example.com/ava.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text('Messages'),
        actions: [
          IconButton(
              onPressed: () {
                // Show search delegate when search icon is pressed
                showSearch(
                    context: context,
                    delegate: MessageSearchDelegate(_messages));
              },
              icon: const Icon(IconlyLight.search))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Divider(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 0, bottom: 5),
        itemCount: _messages.length,
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[300],
            height: 1.0,
          );
        },
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            onTap: () {
              NavigationHelper.navigateTo(
                  context, ChatScreen(contact: message));
            },
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(message.avatarUrl),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText.smaller(
                  message.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontSize: 13,
                  ),
                ),
                AppText.smaller(
                  message.lastMessage,
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            trailing: Column(
              children: [
                AppText.smaller(message.time, size: 10),
                const AppSpacer.vShort(),
                if (message.unreadCount > 0)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ExtraColors.customGreen,
                    ),
                    child: Center(
                      child: AppText.smaller(
                        '${message.unreadCount}',
                        size: 9,
                        color: ExtraColors.white,
                      ),
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
