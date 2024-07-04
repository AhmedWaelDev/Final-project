import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

import 'package:final_project/Service/serviceChat.dart';
import 'package:final_project/cache/cache_helper.dart';

class ChatterScreen extends StatefulWidget {
  final String receiverId; // Receiver ID (doctor or patient ID)

  const ChatterScreen({
    Key? key,
    required this.receiverId,
  }) : super(key: key);

  @override
  _ChatterScreenState createState() => _ChatterScreenState();
}

class _ChatterScreenState extends State<ChatterScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  bool _uploadingImage = false; // State for showing loading indicator
  bool _imageSelectedForUpload =
      false; // State for indicating image selected for upload
  final ChatService _chatService = ChatService();

  bool isSending =
      false; // State for showing loading indicator when sending message

  void _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageSelectedForUpload = true; // Set image selected for upload
      });
    }
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty || _imageFile != null) {
      setState(() {
        isSending =
            true; // Start showing loading indicator when sending message
      });

      String currentUserId = CacheHelper().getData(key: "id") ?? "";
      String senderName = CacheHelper().getData(key: "name") ?? "";
      String text = _messageController.text;
      String receiverId = widget.receiverId; // Replace with actual receiver ID

      String? imageUrl;
      if (_imageFile != null) {
        setState(() {
          _uploadingImage = true; // Start showing loading indicator
        });
        imageUrl = await _chatService.uploadImage(_imageFile!);
        setState(() {
          _uploadingImage = false; // Stop showing loading indicator
          _imageSelectedForUpload = false; // Reset image selected for upload
        });
      }

      await _chatService.sendMessage(
        currentUserId,
        senderName,
        text,
        receiverId,
        imageUrl: imageUrl,
      );
      _messageController.clear();
      setState(() {
        _imageFile = null; // Clear selected image after sending
        isSending =
            false; // Stop showing loading indicator when sending message is done
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Photo Library'),
            onTap: () {
              Navigator.of(context).pop();
              _getImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              Navigator.of(context).pop();
              _getImage(ImageSource.camera);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background color to white
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue, // Adjust back button color
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Chatter',
          style: TextStyle(color: Colors.black), // Adjust title color
        ),
        centerTitle: true,
        elevation: 0, // Remove app bar shadow
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;
                final String currentUserId =
                    CacheHelper().getData(key: "id") ?? "";

                return ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final Map<String, dynamic> messageData =
                        message.data() as Map<String, dynamic>;
                    final String senderId = messageData['sender'];
                    final String receiverId = messageData['receiverId'];

                    // Check if the message involves the current user and the specified receiver
                    final bool isSenderToReceiver = senderId == currentUserId &&
                        receiverId == widget.receiverId;
                    final bool isReceiverFromSender =
                        senderId == widget.receiverId &&
                            receiverId == currentUserId;

                    if (isSenderToReceiver || isReceiverFromSender) {
                      final bool isMe = senderId == currentUserId;

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: isMe
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: isMe ? Colors.blue : Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messageData['senderName'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  if (messageData.containsKey('imageUrl') &&
                                      messageData['imageUrl'] != null)
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                          child: Image.network(
                                            messageData['imageUrl'],
                                            width: 250,
                                          ),
                                        ),
                                        if (_uploadingImage &&
                                            _imageFile == null)
                                          const CircularProgressIndicator(),
                                        if (_imageSelectedForUpload &&
                                            _imageFile != null)
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconButton(
                                              icon: const Icon(Icons.close),
                                              color: Colors.red,
                                              onPressed: () {
                                                setState(() {
                                                  _imageFile = null;
                                                  _imageSelectedForUpload =
                                                      false;
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  const SizedBox(height: 4),
                                  Text(
                                    messageData['text'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    _formatTime(messageData['time'].toDate()),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                );
              },
            ),
          ),
          if (_imageFile != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Image.file(
                  _imageFile!,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_photo_alternate),
                  onPressed: () => _showImageSourceActionSheet(context),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your message...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: isSending
                      ? const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.0,
                          ),
                        )
                      : IconButton(
                          icon: const Icon(Icons.send),
                          color: Colors.white,
                          onPressed: _sendMessage,
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String _formatTime(DateTime? time) {
  if (time == null) return '';
  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}
