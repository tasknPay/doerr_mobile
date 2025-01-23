// Define a model for the message
class MessageModel {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarUrl;

  MessageModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
  });
}
