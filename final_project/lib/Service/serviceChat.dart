import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> sendMessage(
      String currentUserId, String senderName, String text, String receiverId,
      {String? imageUrl}) async {
    final message = {
      'sender': currentUserId,
      'senderName': senderName,
      'text': text,
      'time': DateTime.now(),
      'receiverId': receiverId,
      'imageUrl': imageUrl,
    };
    await _firestore.collection('chats').add(message);
  }

  Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('chats')
        .orderBy('time', descending: true)
        .snapshots();
  }

  Future<String> uploadImage(File imageFile) async {
    String fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
    UploadTask uploadTask = _storage.ref().child(fileName).putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
