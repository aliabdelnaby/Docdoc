class MessageItemModel {
  final String name;
  final String specialization;
  final String degree;
  final String image;
  final bool isUnread;
  final String time;
  final String message1;
  final String message2;

  final String? numberOfUnreadMessages;

  MessageItemModel({
    required this.name,
    required this.specialization,
    required this.degree,
    required this.image,
    required this.isUnread,
    required this.time,
    required this.message1,
    this.numberOfUnreadMessages,
    required this.message2,
  });
}
