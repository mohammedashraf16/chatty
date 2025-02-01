class Message {
  static const String collectionName = "messages";
  String id;
  String roomId;
  String content;
  String senderId;
  String senderName;
  int dateTime;

  Message({
    this.id = "",
    required this.roomId,
    required this.content,
    required this.senderId,
    required this.senderName,
    required this.dateTime,
  });

  Message.fromJson(Map<String,dynamic> json):this(
    id: json['id'],
    roomId: json['roomId'],
    content: json['content'],
    senderId: json['senderId'],
    senderName: json['senderName'],
    dateTime: json['dateTime'],
  );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'roomId': roomId,
      'content': content,
     'senderId': senderId,
     'senderName': senderName,
      'dateTime': dateTime,
    };
  }
}
