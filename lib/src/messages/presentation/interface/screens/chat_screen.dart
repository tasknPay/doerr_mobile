import 'package:doerr/shared/presentation/widgets/constants/app_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/theme/extra_colors.dart';
import '../../../domain/entity/message.dart';

class ChatScreen extends StatefulWidget {
  final MessageModel contact;

  const ChatScreen({super.key, required this.contact});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        // Sent message
        _messages.insert(0, {
          'text': _messageController.text.trim(),
          'isSentByMe': true,
          'status': MessageStatus.sent,
        });

        // Simulate received message
        _messages.insert(0, {
          'text': 'Got: ${_messageController.text.trim()}',
          'isSentByMe': false,
          'status': MessageStatus.read,
        });

        _messageController.clear();
      });
    }
  }

  Widget _buildStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sent:
        return const Icon(Icons.check, color: Colors.grey, size: 16);
      case MessageStatus.delivered:
        return const Icon(Icons.check_circle, color: Colors.blue, size: 16);
      case MessageStatus.read:
        return const Icon(Icons.done_all, color: Colors.blue, size: 16);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Divider(
              color: Colors.grey[300],
              height: 1.0,
            ),
          ),
          centerTitle: false,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.contact.avatarUrl),
                radius: 20,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.contact.name,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const AppSpacer.vShorter(),
                  const Text(
                    'Online',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.more_circle),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];

                  // Sent messages with status
                  if (message['isSentByMe']) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(100, 8, 0, 8),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: ExtraColors.customGreen.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(message['text']),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: _buildStatusIcon(message['status']),
                        ),
                      ],
                    );
                  }

                  // Received messages
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          message['isSentByMe'] ? 100 : 0,
                          8,
                          message['isSentByMe'] ? 0 : 100,
                          8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(message['text']),
                    ),
                  );
                },
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      color: ExtraColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.link, color: Colors.grey),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              maxLines: null,
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(IconlyLight.camera, color: Colors.grey),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: Icon(
              _messageController.text.isEmpty
                  ? IconlyLight.send
                  : IconlyBold.send,
              color: ExtraColors.customGreen,
            ),
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }
}
