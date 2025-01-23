class MessageModel {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String avatarUrl;
  final MessageStatus status; // New property

  MessageModel({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.avatarUrl,
    this.status = MessageStatus.sent, // Default status
  });
}

// Enum to represent message status
enum MessageStatus {
  sent, // Message sent but not delivered
  delivered, // Message delivered to recipient
  read // Message read by recipient
}
