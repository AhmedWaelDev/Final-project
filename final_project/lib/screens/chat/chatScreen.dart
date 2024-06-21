import 'package:flutter/material.dart';

class ChatterScreen extends StatefulWidget {
  const ChatterScreen({super.key});

  @override
  _ChatterScreenState createState() => _ChatterScreenState();
}

class _ChatterScreenState extends State<ChatterScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'Alice', 'text': 'Hello!'},
    {'sender': 'Bob', 'text': 'Hi there!'},
    {'sender': 'You', 'text': " 213السلام عليكم"}
    // Add more static messages if needed
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'sender': 'You',
          'text': _messageController.text,
        });
        _messageController.clear();
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollToBottom();
      });
    }
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
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['sender'] == 'You';
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 16.0,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: isMe
                                ? Colors.lightBlueAccent
                                : Colors.grey[300],
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0),
                              bottomLeft: !isMe
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(20.0),
                              bottomRight: isMe
                                  ? const Radius.circular(0.0)
                                  : const Radius.circular(20.0),
                            ),
                          ),
                          padding: const EdgeInsets.all(12.0),
                          constraints: const BoxConstraints(maxWidth: 250.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                message['sender']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                message['text']!,
                                style: TextStyle(
                                  color: isMe ? Colors.white : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
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
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Button background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: _sendMessage,
                    ),
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
