import 'package:flutter/material.dart';
import 'package:final_project/screens/chat/chatScreen.dart';

class CustomChatItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final String message;
  final int unreadMessages;
  final String time;
  final String receiverId; // Add receiverId as a property
  // Add receiverName as a property

  const CustomChatItem({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.message,
    required this.unreadMessages,
    required this.time,
    required this.receiverId, // Initialize receiverId
    // Initialize receiverName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatterScreen(
              receiverId: receiverId,
            ),
          ),
        );
      },
      child: Container(
        height: size.height * 89 / 930,
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(imagePath),
          ),
          title: Text(
            name,
            style: const TextStyle(
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
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              if (unreadMessages > 0)
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadMessages.toString(),
                    style: const TextStyle(
                      color: Color(0xffe5e9f0),
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
