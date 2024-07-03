import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String content;
  final String time;
  final String senderId;
  final String receiverId;

  Message({
    required this.content,
    required this.time,
    required this.senderId,
    required this.receiverId,
  });
/*
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      content: json['content'],
      time: json['time'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
    );
  }*/

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'time': time
    };
  }
}
