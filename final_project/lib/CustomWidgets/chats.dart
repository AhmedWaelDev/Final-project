import 'package:flutter/material.dart';

class CustomChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final int unreadMessages;
  final String time;

  const CustomChatItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.message,
    required this.unreadMessages,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(imagePath),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        message,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          if (unreadMessages > 0)
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadMessages.toString(),
                style: TextStyle(
                  color: Color(0xffe5e9f0),
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
