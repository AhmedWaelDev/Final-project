import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_project/Service/serviceChat.dart';
import 'package:final_project/cache/cache_helper.dart';

class ChatterScreen extends StatefulWidget {
  final String receiverId; // Receiver ID (doctor or patient ID)
  final String receiverName;

  const ChatterScreen({
    Key? key,
    required this.receiverId,
    required this.receiverName,
  }) : super(key: key);

  @override
  _ChatterScreenState createState() => _ChatterScreenState();
}

class _ChatterScreenState extends State<ChatterScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  bool _uploadingImage = false;
  bool _imageSelectedForUpload = false;
  final ChatService _chatService = ChatService();
  bool _sendingMessage = false; // Add sending message state

  void _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageSelectedForUpload = true;
      });
    }
  }

  void _sendMessage() async {
    if (_messageController.text.isNotEmpty || _imageFile != null) {
      setState(() {
        _sendingMessage = true; // Start sending message loading state
      });

      String currentUserId = CacheHelper().getData(key: "id") ?? "";
      String senderName = CacheHelper().getData(key: "name") ?? "";
      String text = _messageController.text;
      String receiverId = widget.receiverId;

      String? imageUrl;
      if (_imageFile != null) {
        setState(() {
          _uploadingImage = true;
        });
        imageUrl = await _chatService.uploadImage(_imageFile!);
        setState(() {
          _uploadingImage = false;
          _imageSelectedForUpload = false;
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
        _imageFile = null;
        _sendingMessage = false; // Stop sending message loading state
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
            leading: Icon(Icons.photo),
            title: Text('Photo Library'),
            onTap: () {
              Navigator.of(context).pop();
              _getImage(ImageSource.gallery);
            },
          ),
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text('Camera'),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.blue,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.receiverName,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _chatService.getMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
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
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.symmetric(vertical: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messageData['senderName'],
                                    style: TextStyle(
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
                                          margin: EdgeInsets.only(top: 8),
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
                                          CircularProgressIndicator(),
                                        if (_imageSelectedForUpload &&
                                            _imageFile != null)
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: IconButton(
                                              icon: Icon(Icons.close),
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
                                  SizedBox(height: 4),
                                  Text(
                                    messageData['text'],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    _formatTime(messageData['time'].toDate()),
                                    style: TextStyle(
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
                  icon: Icon(Icons.add_photo_alternate),
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
                          offset: const Offset(0, 3),
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
                  child: _sendingMessage
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.send),
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
